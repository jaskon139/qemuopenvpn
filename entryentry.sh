#!/bin/sh

qemu-system-x86_64 -nographic -net nic,vlan=0 -net user -m 128 -hda /app/ssh_and_ss/tc/tinycore.img < /dev/null &

cd /app/bin && npm install && /usr/local/bin/node app.js -p 3000
