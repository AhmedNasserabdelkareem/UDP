//
// Created by ahmednasser on 12/7/19.
//

#ifndef UDP_ACTIONS_H
#define UDP_ACTIONS_H



#include <iostream>
#include <stab.h>
#include <string>
#include <unordered_map>

using namespace std;
class Actions {
private:
    unordered_map<string , int> *actions;
public:
    Actions(string acLabels [], int l){
        this->actions = new unordered_map<string , int>();
        for(int i =0 ; i< l ; i ++ ){
            printf("\nAction  %s id %d\n",acLabels[i].c_str(),i);
            (*this->actions)[acLabels[i]] = i;
        }
    }
    int getActionID(string ac){
        return (*this->actions)[ac];
    }

};



#endif //UDP_ACTIONS_H
