FROM jaskon139/ccssshh

RUN git clone https://github.com/jaskon139/ssh_and_ss.git

RUN cp ssh_and_ss/entrypoint.sh /usr/local/bin/entrypoint.sh && chmod +x /usr/local/bin/entrypoint.sh && chmod 777 /usr/local/bin/entrypoint.sh

RUN cd ssh_and_ss && chmod +x ./entrypointqemu.sh && ./entrypointqemu.sh

CMD /usr/local/bin/entrypoint.sh
