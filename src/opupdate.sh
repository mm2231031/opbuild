#!/bin/bash
opupdate(){
        git clone https://github.com/coolsnowwolf/lede 2>/dev/null
        cd lede
        git pull 
        ./scripts/feeds update -a 
        ./scripts/feeds install -a
}

opupdate
