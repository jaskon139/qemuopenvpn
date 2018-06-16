FROM freeflyer/wetty

RUN apt-get install -y qemu

CMD ["bin/entrypoint.sh"]
