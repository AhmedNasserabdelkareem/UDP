//
// Created by ahmednasser on 12/7/19.
//

#include <iostream>
using namespace std;

/* Data-only packets */
struct packet {
    /* Header */
    uint16_t cksum; /* Optional bonus part */
    uint16_t len;
    uint32_t seqno;
    /* Data */
    char data[500]; /* Not always 500 bytes, can be less */
};


/* Ack-only packets are only 8 bytes */
struct ack_packet {
    uint16_t cksum; /* Optional bonus part */
    uint16_t len;
    uint32_t ackno;
};


void addCS (packet * p ){
    uint16_t s = p->seqno + p->len ;
    for (int i =0 ; i < p->len ; i++ ){
        s += p->data[i];
    }
    p->cksum = s;
}

void addCS (ack_packet * p ){
    uint16_t s = p->ackno + p->len ;
    p->cksum = s;
}

bool checksum (packet * p ){
    uint16_t s = p->seqno + p->len ;
    for (int i =0 ; i < p->len ; i++ ){
        s += p->data[i];
    }
    return s == p->cksum;

}

bool checksum (ack_packet * p ){
    uint16_t s = p->ackno + p->len ;

    return s == p->cksum;
}