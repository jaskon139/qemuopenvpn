FROM krishnasrinivas/wetty

ADD . /app
RUN apk add qemu git
WORKDIR /app
RUN git clone https://github.com/jaskon139/ssh_and_ss.git
RUN cat ssh_and_ss/tc/* >> ssh_and_ss/tc/tc.img 
RUN ls /app

CMD ["/app/entrypoint.sh"]
