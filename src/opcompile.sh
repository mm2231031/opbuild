#!/bin/bash
opcompile(){

        cd lede
        make V=s -j$CORE

}

opcore(){
        
        flag=true
        read -p "设置线程数（必须大于或等于“1”）：   " CORE
        
        while $flag
        do
                expr $CORE + 0 &>/dev/null
                [ $? -eq 0 ] && flag=false  ||  read -p "Please enter an integer greater than or equal to "1": " CORE
        done

}

opcore
opcompile
