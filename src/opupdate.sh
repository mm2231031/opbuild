#!/bin/bash
opupdate(){
        git clone https://github.com/coolsnowwolf/lede
        cd lede
        git pull 
        ./scripts/feeds update -a 
        ./scripts/feeds install -a
}

opupdate
