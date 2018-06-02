#!/bin/sh

qemu-system-x86_64 -nographic -net nic,vlan=0 -net user -m 128 -hda /ssh_and_ss/tc/tinycore.img < /dev/null &

cd /bktty && npm install && node app.js -p 3000
