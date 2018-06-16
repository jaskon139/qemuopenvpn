FROM freeflyer/wetty

RUN apk add qemu

CMD ["bin/entrypoint.sh"]
