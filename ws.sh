#!/bin/sh
docker build -t ose-ws . && 
clear && 
docker run -it -v $(pwd):/xv6-labs ose-ws bash
