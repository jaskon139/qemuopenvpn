FROM freeflyer/wetty

RUN apk add qemu git

WORKDIR /app

RUN git clone https://github.com/jaskon139/ssh_and_ss.git

RUN cat ssh_and_ss/tc/* >> ssh_and_ss/tc/tc.img 

RUN ls /app

CMD ["bin/entrypoint.sh"]
