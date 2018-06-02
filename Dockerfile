FROM jaskon139/ccssshh

RUN apt-get update

RUN apt-get install -y git

RUN git clone https://github.com/jaskon139/ssh_and_ss.git /ssh_and_ss
RUN git clone https://github.com/buildkit-io/bktty.git /bktty 

RUN apt-get install -y -qq software-properties-common python-software-properties module-init-tools
RUN apt-get install -y shadowsocks-libev net-tools grep 
RUN add-apt-repository -y ppa:alessandro-strada/ppa 2>&1 > /dev/null
RUN apt-get update -qq 2>&1 > /dev/null
RUN apt-get -y install -qq google-drive-ocamlfuse fuse
RUN apt-get install -y shadowsocks-libev net-tools grep tmux qemu net-tools expect shadowsocks-libev openssh-server sshpass tmux screen 

RUN cat /ssh_and_ss/tc/* >> /ssh_and_ss/tc/tinycore.img 
RUN apt-get install openssh-server expect
RUN sed -e 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

RUN mkdir -p /home/apple
RUN useradd -m -s /bin/bash apple

RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y
RUN apt-get install curl npm vim wget git sudo zip unzip apt-transport-https screen lsb-release ca-certificates build-essential automake python python3 python3-pip -y

#deluged
#deluged
RUN apt-get install -y deluged deluge-web
RUN mkdir -p /content/delugeconf
RUN cat /ssh_and_ss/mikimg/* >> /ssh_and_ss/mikimg/fedora.img

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

ADD entryentry.sh /

RUN mv /entryentry.sh /usr/local/bin/entrypointqemu.sh && chmod +x /usr/local/bin/entrypointqemu.sh && chmod 777 /usr/local/bin/entrypointqemu.sh

CMD /usr/local/bin/entrypointqemu.sh
