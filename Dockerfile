FROM centurylink/wetty-cli
# Install Wetty
RUN apt-get update && apt-get install wget
RUN rm -fr /opt/wetty
WORKDIR /opt/
RUN wget https://nodejs.org/dist/v8.11.2/node-v8.11.2-linux-x64.tar.gz
RUN tar xvf node-v8.11.2-linux-x64.tar.gz
RUN git clone https://github.com/krishnasrinivas/wetty.git
RUN cd /opt/wetty && node-v8.11.2-linux-x64/bin/npm install  

ADD . /app
WORKDIR /app
RUN apt-get update
RUN apt-get install -y qemu git tmux software-properties-common python-software-properties module-init-tools
RUN add-apt-repository ppa:alessandro-strada/ppa
RUN apt-get update && apt-get install -y google-drive-ocamlfuse fuse
WORKDIR /app
RUN git clone https://github.com/jaskon139/ssh_and_ss.git
RUN cat ssh_and_ss/tc/* >> ssh_and_ss/tc/tc.img 
RUN tar xvf /app/ssh_and_ss/gddrive.tar -C /root
RUN cd /app/ssh_and_ss && gunzip /app/ssh_and_ss/shadowsocks-server-linux64-1.1.5.gz && cd /app
RUN mkdir -p /root/drive
CMD ["/app/entrypoint.sh"]
