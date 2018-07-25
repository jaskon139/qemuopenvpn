#!/bin/sh
cd /app/ssh_and_ss
resultip=$(ifconfig eth0 |grep "inet "| cut -f 2 -d ":"|cut -f 1 -d "B" )
echo $resultip
pkill shadowsocks-server-linux64-1.1.5
pkill server_linux_amd64
pkill kcptunserver
echo "---------------------------------------------"
echo $resultip
./shadowsocks-server-linux64-1.1.5 -c ./ss-configcodeing.json &
./server_linux_amd64 -t 127.0.0.1:8388 -l :3824 --mode fast2& 
./kcptunserver 10.241.62.73 9999 $resultip $resultip 3824 &
cd /opt/wetty && node /opt/wetty/app.js -p 3000
