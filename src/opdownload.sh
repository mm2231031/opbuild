#!/bin/bash
opdownload(){
cd lede
make download V=s -j4
}


opdownload
