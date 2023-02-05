FROM vault:1.12.2

ADD files/server.json /etc/vault/server.json

ENTRYPOINT [ "vault", "server"]

CMD [ "-config=/etc/vault/server.json" ]
