FROM vault:1.12.2

COPY files/server.json /etc/vault/server.json

RUN "sudo apt update && sudo apt upgrade -y"

ENTRYPOINT [ "vault", "server"]

CMD [ "-config=/etc/vault/server.json" ]
