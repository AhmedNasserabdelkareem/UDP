//
// Created by ahmednasser on 12/7/19.
//

#ifndef UDP_CONGESTIONCONTROLLER_H
#define UDP_CONGESTIONCONTROLLER_H

#include "state.h"
#include "Actions.h"
#include "params.h"

#define newACK "new ACK"
#define dupACK "dup ACK"
#define TO "timeout"
#define dupACK3 "3 dupAck"
#define  cwndGss "cwnd>=ssthresh"
#define NUM_OF_ACTIONS 5

class congestionController {
private:
    state * currState ;
    Actions * acs;
public:
    params * p ;
    congestionController(){
        congestionController *curr = this;
        string ls [] = {newACK,TO,dupACK,dupACK3,cwndGss};
        acs = new Actions(ls,NUM_OF_ACTIONS);
        this->p = new params();
        state * slowStart= new state(p,NUM_OF_ACTIONS,"slow start"), *conAv= new state(p,NUM_OF_ACTIONS,"congestion avoidance") , * fastRec = new state(p,NUM_OF_ACTIONS,"fast recovery");
        this->currState = slowStart;


        //setting slowStart

        slowStart->setNextState(acs->getActionID(newACK),slowStart,[](params * pp)->void{
            pp->cwnd += pp->MSS;
            pp->dupACKcount =0;
            //Transmit new Seg
        });
        slowStart->setNextState(acs->getActionID(dupACK),slowStart,[]( params * pp)->void{
            pp->dupACKcount++;
        });
        slowStart->setNextState(acs->getActionID(TO),slowStart,[](params * pp)->void{
            pp->ssthresh = pp->cwnd /2;
            pp->cwnd =  pp->MSS;
            pp->dupACKcount=0;
            pp->retransmit= true;
        });
        slowStart->setNextState(acs->getActionID(dupACK3),fastRec,[](params * pp)->void{
            pp->ssthresh = pp->cwnd /2;
            pp->cwnd = pp->ssthresh+ 3 * pp->MSS;
            pp->retransmit= true;
        });
        slowStart->setNextState(acs->getActionID(cwndGss),conAv,[](params * pp)->void{
            //NOTHING
        });



        //congestion avoidance
        conAv->setNextState(acs->getActionID(newACK),conAv,[](params * pp)->void{
            pp->cwnd += pp->MSS * (pp->MSS/pp->cwnd);
            pp->dupACKcount =0;
            //Transmit new Seg
        });
        conAv->setNextState(acs->getActionID(dupACK),conAv,[](params * pp)->void{
            pp->dupACKcount++;
        });
        conAv->setNextState(acs->getActionID(TO),slowStart,[](params * pp)->void{
            pp->ssthresh = pp->cwnd /2;
            pp->cwnd =  pp->MSS;
            pp->dupACKcount=0;
            pp->retransmit = true;
        });
        conAv->setNextState(acs->getActionID(dupACK3),fastRec,[](params * pp)->void{
            pp->ssthresh = pp->cwnd /2;
            pp->cwnd = pp->ssthresh+ 3 * pp->MSS;
            pp->retransmit = true;
        });
        conAv->setNextState(acs->getActionID(cwndGss),conAv,[](params * pp)->void{
            //NOTHING
        });




        //fast  recovery
        fastRec->setNextState(acs->getActionID(newACK),conAv,[](params * pp)->void{
            pp->cwnd = pp->ssthresh;
            pp->dupACKcount =0;
            //Transmit new Seg
        });
        fastRec->setNextState(acs->getActionID(dupACK),fastRec,[](params * pp)->void{
            pp->cwnd += pp->MSS;
            //transmit new seg
        });
        fastRec->setNextState(acs->getActionID(TO),slowStart,[](params * pp)->void{
            pp->ssthresh = pp->cwnd /2;
            pp->cwnd = pp->MSS ;
            pp->dupACKcount=0;
            pp->retransmit = true;
        });
        fastRec->setNextState(acs->getActionID(dupACK3),fastRec,[](params * pp)->void{
            //NOTHING
        });
        fastRec->setNextState(acs->getActionID(cwndGss),fastRec,[](params * pp)->void{
            //NOTHING
        });



    }
//    void control(string action){
//        currState = currState->getNextState(acs->getActionID(action));
//    }
    void dupAck(){
        //printf("on state %s , dupAck ",currState->name.c_str());
        currState = currState->getNextState(acs->getActionID(dupACK),dupACK);
        if(p->dupACKcount>=3){
            //  printf("  -- dupAck >=3 -- ");
            currState = currState->getNextState(acs->getActionID(dupACK3),dupACK3);
            //printf(" to state %s",currState->name.c_str());
        }
        if(p->cwnd >= p->ssthresh){
            //printf(" -- gwndGss -- ");
            currState = currState->getNextState(acs->getActionID(cwndGss),cwndGss);
            //printf(" to state %s",currState->name.c_str());
        }
        //printf("\n");

    }
    void newAck(){
        //printf("on state %s , newAck ",currState->name.c_str());

        currState = currState->getNextState(acs->getActionID(newACK),newACK);
        if(p->cwnd >= p->ssthresh){
            //  printf(" -- gwndGss -- ");
            currState = currState->getNextState(acs->getActionID(cwndGss),cwndGss);

        }
        //printf(" to state %s",currState->name.c_str());

        //printf("\n");
    }

    void timeout(){
        //printf("on state %s , dupAck ",currState->name.c_str());

        currState = currState->getNextState(acs->getActionID(TO),TO);
        //printf(" to state %s",currState->name.c_str());

        //printf("\n");
    }

};


#endif //UDP_CONGESTIONCONTROLLER_H
