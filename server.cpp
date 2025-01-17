//
// Created by ahmednasser on 12/7/19.
//

#include <cstdio>
#include <cstdlib>
#include <unistd.h>
#include <cstring>
#include <ctime>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <pthread.h>
#include "packets.cpp"
#include "congestionController.h"
#include <mutex>
#include <fstream>
#include <sstream>
#include <vector>

int PORT =  8080;
#define MAXLINE 508
#define ALPHA 0.125
#define  BETA 0.25
float  PLP= 0.1;
int seed=0;
class node{
public:
    int v = -1;
    int seqNum = -1;
    node*next = nullptr;
    int acked= 0;
    time_t stamp = 0;


};

double myTime(){
    using namespace std::chrono;
    milliseconds ms = duration_cast< milliseconds >(
            system_clock::now().time_since_epoch()
    );
    return ms.count();
}
int markAcked(node * head1, int a){
    node * head = head1;
    while(head->next != nullptr){
        if(head->next->seqNum == a ){
            head->next->acked++;
            return head->next->acked;
        }
        head = head->next;
    }
    return -1;

}

void printWND(node * head){
    node * c = head;
    printf("\n");
    while(c->next!= nullptr){
        printf("%d ->",c->next->seqNum);
        c=c->next;
    }
    printf("\n");
}
struct thPar{
    vector<float> *gr2=new vector<float>();
    vector<float> *gr1=new vector<float>();

    int sfd=1;
    string *path = new string ();
    struct  sockaddr_in * cliaddr = nullptr;
    int len=0;
    congestionController * cc = new congestionController();
    std::mutex *ccm = new std::mutex();
    bool done = false;
    node * head = new node(); //this list is the window head ;
    int LLlen=0;
    long timeoutInterval =1000;
    long ertt=1000;
    long devrtt=1000;

};
long getErtt(long prevertt,float alpha , long rtt ){
    return (1-alpha) * prevertt + alpha * rtt;
}
long getDevRTT(long prevDevrtt,float beta , long rtt , long ertt){
    return (1-beta) * prevDevrtt + beta * abs(rtt-ertt);
}
time_t updateTO(long ERTT , long DevRTT){
    int constA = 0;
    return ERTT + 4*DevRTT+constA ;// adding const to show the effect of TO
}

void *rec(void * arg) {   //receive and throw in the queue

    thPar *p = ((thPar *) arg);
    auto * ack = new ack_packet();
    int len, n=-1;
    len = sizeof(*p->cliaddr);
    while(!p->done || p->LLlen >0) {
        n = -1;
        while (n == -1){
            n = recvfrom(p->sfd, ack, sizeof(ack_packet),
                         MSG_WAITALL, (struct sockaddr *) p->cliaddr,
                         reinterpret_cast<socklen_t *>(&p->len));
        }
        if(!checksum(ack)){
            printf("CHECKSUM ERROR");
            continue;
        }
        printf("ack rec with ack no : %d \n", ack->ackno);
        while (p->head->next == nullptr);
        p->ccm->lock();
        printWND(p->head);

        int expAck =p->head->next->seqNum+1; //the expected ack


        if(ack->ackno >= expAck){            //GBN

            long lastTime=-1;
            while (p->head->next != nullptr&&p->head->next->seqNum  <ack->ackno){
                p->cc->newAck();
                node *temp = p->head->next;
                p->head->next = p->head->next->next;
                p->LLlen--;
                lastTime = temp->stamp;
                delete temp;// deleting the acked node
            }
            if(lastTime!=-1) {
                long rtt = myTime() - lastTime;
                p->ertt = getErtt(p->ertt, ALPHA, rtt);
                p->devrtt = getDevRTT(p->devrtt, BETA, rtt, p->ertt);
                p->timeoutInterval = updateTO(p->ertt, p->devrtt);
                // printf("rtt %ld , devrtt %ld, toi %ld\n",rtt,p->devrtt,p->timeoutInterval);
            }

        } else if(ack->ackno == expAck-1){
            p->cc->dupAck();
        }
        p->ccm->unlock();
    }


}
void *handle_client(void * arg) {
    thPar *p= ((thPar *) arg);
    auto *data = new packet();
    vector<int> gr{};

    data->seqno=1;

    printf("path:%s\n",p->path->c_str());
    fstream file;

    file.open(*p->path,ios::out|ios::in|ios::app|ios::binary);

    if(!file){
        printf("\n path not found \n ");
    }

    file.seekg(0,ios::end);
    int size  = (int )file.tellg();
    file.seekg(0,ios::beg);


    float counter = (float)size/500;
    int toread = 500;
    node *tail = p->head;
    printf("\nsize is %d , counter is %f\n",size,counter);

    float prevCounter=0 ;
    int filepos=0;

    while(counter > 0 || (p->LLlen !=0 )) {
        filepos = file.tellg();
        prevCounter = counter;

        p->ccm->lock();
        printf("\n\n\nSENDER %d",p->LLlen);
        printWND(p->head);
        int re=0;
        if(counter<1){
            toread = size % 500;
        }
        //printf("\ncurrent counter %f , to read %d\n",counter,toread);

        if(p->LLlen==0){
            tail = p->head;
        }


        if(p->head->next!= nullptr&&p->head->next->stamp+p->timeoutInterval < myTime()){
            printf("time out .. last timeI %ld\n",p->timeoutInterval);
            p->cc->timeout();
        }

        if(counter<=0 && !p->cc->p->retransmit){
            p->ccm->unlock();
            continue;
        }
        float numPackToSend = p->cc->p->cwnd / (float)p->cc->p->MSS ;
        //printf("\nnumber of packets allowed is %f len of history is %d \n",numPackToSend,p->LLlen);


        if(p->cc->p->retransmit){             //rollback
            printf("retr %d\n",p->head->next->seqNum);
            node * h = p->head;
            file.seekg(h->next->v);
            data->seqno = h->next->seqNum-1;
            counter = (float)(size - file.tellg())/500;
            toread=500;
            p->LLlen = 0;
            h->next = nullptr; // GOBACK N
            tail=h;
            p->cc->p->retransmit= false;
        }

        if(p->LLlen > numPackToSend){ //allow sending within the window
            p->ccm->unlock();
            continue;
        }
        //adding current vars to history
        tail->next = new node();
        tail = tail->next;
        tail->v = file.tellg();
        tail->stamp = myTime();
        tail->seqNum = data->seqno+1;
        p->LLlen++;

        p->ccm->unlock();



        file.read(data->data ,toread);
        data->seqno +=1;
        data->len = toread+8;

        gr.push_back(p->cc->p->cwnd / p->cc->p->MSS);
        bool send =random() % 100 >= PLP*100;
        if( send) {
            addCS(data);
            sendto(p->sfd, data, sizeof(packet),
                   MSG_CONFIRM, (const struct sockaddr *) p->cliaddr,
                   p->len);
        }else{
            printf("packet skipped\n");
        }

        //printf("data sent seq no %d.\n", data->seqno);
        counter--;
    }

    p->done=true;
    data->len = 8;
    addCS(data);
    sendto(p->sfd, data, sizeof(packet),
           MSG_CONFIRM, (const struct sockaddr *) p->cliaddr,
           p->len);
    file.close();
}
int main() {


    std::ifstream infile("sever.in");
    std::string line;

    std::getline(infile, line);
    std::istringstream is(line);
    is >> PORT;
    std::getline(infile, line);
    std::istringstream iss(line);
    iss >> seed;
    srandom(seed);
    std::getline(infile, line);
    std::istringstream isss(line);
    isss >> PLP;
    printf("%f %d %d", PLP, PORT, seed);
    int sockfd;
    struct sockaddr_in servaddr, cliaddr;

    // Creating socket file descriptor
    if ((sockfd = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
        perror("socket creation failed");
        exit(EXIT_FAILURE);
    }

    memset(&servaddr, 0, sizeof(servaddr));
    memset(&cliaddr, 0, sizeof(cliaddr));

    // Filling server information
    servaddr.sin_family = AF_INET; // IPv4
    servaddr.sin_addr.s_addr = INADDR_ANY;
    servaddr.sin_port = htons(PORT);

    // Bind the socket with the server address
    if (bind(sockfd, (const struct sockaddr *) &servaddr,
             sizeof(servaddr)) < 0) {
        perror("bind failed");
        exit(EXIT_FAILURE);
    }

    auto *data = new packet();
    int c = 100;
    while (c != 0) {
        int len, n;
        socklen_t sendsize = sizeof(servaddr);
        len = sendsize;
        n = recvfrom(sockfd, data, sizeof(packet),
                     MSG_WAITALL, (struct sockaddr *) &cliaddr,
                     reinterpret_cast<socklen_t *>(&len));

        if (n != sizeof(packet)) {
            continue;
        }

        auto *client = new pthread_t();
        auto *th = new pthread_t();
        auto *p = new thPar();
        p->path->append(data->data);
        printf("path : %s", p->path->c_str());
        p->sfd = sockfd;
        p->cliaddr = &cliaddr;
        p->len = len;
        printf("creatingThreads...\n");
        pthread_create(th, NULL, rec, p);
        pthread_create(client, NULL, handle_client, p);
        c--;
    }
}