FROM freeflyer/wetty

RUN apk install -y qemu

CMD ["bin/entrypoint.sh"]
