FROM jaskon139/ccssshh

RUN git clone https://github.com/jaskon139/ssh_and_ss.git

RUN cd ssh_and_ss && chmod +x ./entrypointqemu.sh && ./entrypointqemu.sh

CMD /usr/local/bin/entrypoint.sh
