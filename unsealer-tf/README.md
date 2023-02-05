# Overview

Infrastructure created at [fly.io](https://fly.io) using the terraform [fly provider](https://registry.terraform.io/providers/fly-apps/fly/latest/docs).

## Dependencies

### Tools

1. terraform
1. terraform-docs

### Environment Variables

- FLY_API_TOKEN - to access the fly.io machines app api.

- FLY_API_HOSTNAME - Depending on [how access to fly api](https://fly.io/docs/reference/private-networking/#private-network-vpn) will do
  - FLY_API_HOSTNAME=127.0.0.1:4280 if access via proxy: `fly machines api-proxy`  

  - FLY_API_HOSTNAME=_api.internal:4280 if access via wireguard tunnels
