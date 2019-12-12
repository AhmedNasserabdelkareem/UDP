//
// Created by ahmednasser on 12/7/19.
//

#ifndef UDP_PARAMS_H
#define UDP_PARAMS_H


class params {
public:
    float cwnd ;
    float ssthresh = 64000;
    int dupACKcount = 0;
    int MSS = 500;
    bool retransmit;
    params(){
        cwnd= 1 * MSS;
    }

};


#endif //UDP_PARAMS_H
