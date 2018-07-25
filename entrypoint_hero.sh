#!/bin/sh
resultip=$(ifconfig eth0 |grep "inet "| cut -f 2 -d "t"|cut -f 1 -d "n" )
pkill ss-server
pkill server_linux_amd64
pkill kcptunserver
echo "---------------------------------------------"
echo $resultip
ss-server -c ./ss-configcodeing.json &
./server_linux_amd64 -t 127.0.0.1:8388 -l :3824 --mode fast2& 
./kcptunserver 10.241.62.73 9999 $resultip $resultip 3824 
cd /opt/wetty && node /opt/wetty/app.js -p 3000
