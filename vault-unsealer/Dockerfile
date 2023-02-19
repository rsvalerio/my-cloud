FROM vault:1.12.3

COPY files/server.json /etc/vault/server.json

ENTRYPOINT [ "vault", "server"]

CMD [ "-config=/etc/vault/server.json" ]
