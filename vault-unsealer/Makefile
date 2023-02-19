SHELL:=bash

app:= vault-unsealer

destroy:
	flyctl destroy ${app}

create:
	flyctl apps create ${app}
	make create-volume -f Makefile

create-volume:
	flyctl volumes create vault_unsealer -s 1 -r ams

deploy:
	flyctl deploy

list:
	flyctl apps list

status:
	flyctl status

init:
	vault operator init \
    -key-shares=1 \
    -key-threshold=1

# expect vault creds env vars
unseal:
	@VAULT_TOKEN=${VAULT_TOKEN} \
	VAULT_ADDR=${VAULT_ADDR} \
	vault operator unseal ${VAULT_UNSEAL_KEY_1}

# expect vault creds env vars
config:
	@VAULT_TOKEN=${VAULT_TOKEN} \
	VAULT_ADDR=${VAULT_ADDR} \
	vault secrets enable transit || true
	vault write -f transit/keys/autounseal || true
	vault policy write autounseal files/unseal-policy.json || true

config-wrapping-token:
	@VAULT_TOKEN=${VAULT_TOKEN} \
	VAULT_ADDR=${VAULT_ADDR} \
	vault token create -orphan -policy="autounseal" -wrap-ttl=120 -period=24h
