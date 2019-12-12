//
// Created by ahmednasser on 12/7/19.
//

#ifndef UDP_STATE_H
#define UDP_STATE_H

#include "Actions.h"
#include <unordered_map>
#include "params.h"

class state {
public:
    struct stateAction{
        state *next;
        void (*updater) (params * p );
    };
private:
    stateAction **nextState ;
    params * p ;
public:
    string name ="non";
    state(params * pp, int max,string n){
        this->name = n;
        this->p  = pp;
        this->nextState = new stateAction*[max];
    }
    void setNextState(int ac , state * next ,void (*update)(params *)){
        stateAction * st = new stateAction();
        st->next = next;
        st->updater = update;
        this->nextState[ac]= st;
    }

    state * getNextState(int ac,string acn){

        stateAction * cur = *(this->nextState + ac);
        (*cur->updater)(p);
        if(this != cur->next)
            printf("\non state %s action %s new params cwnd, ssthres, dupCnt: %f %f %d next state :%s \n"
                    ,this->name.c_str() , acn.c_str() , p->cwnd,p->ssthresh,p->dupACKcount , cur->next->name.c_str() );
        return (cur)->next;
    }
};


#endif //UDP_STATE_H
