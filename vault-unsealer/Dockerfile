FROM vault:1.12.2

COPY files/server.json /etc/vault/server.json

RUN "DEBIAN_FRONTEND=noninteractive sudo apt-get update && sudo apt-get -y upgrade"

ENTRYPOINT [ "vault", "server"]

CMD [ "-config=/etc/vault/server.json" ]
