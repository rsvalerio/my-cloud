resource "fly_machine" "machines" {
  for_each = toset(var.regions)
  region   = each.key
  app      = var.app
  name     = "${each.key}-${var.app}"
  image    = var.image
  services = var.services
  cpus     = var.cpus
  memorymb = var.memorymb
  mounts = [{
    volume = "${each.key}_${var.app}_vol",
    path   = "/data"
  }]
  # env = {
  #   VAULT_LOCAL_CONFIG = "{\"storage\": {\"file\": {\"path\": \"/data/vault-storage\"}}, \"listener\": [{\"tcp\": { \"address\": \"0.0.0.0:8200\", \"tls_disable\": true}}], \"default_lease_ttl\": \"168h\", \"max_lease_ttl\": \"720h\", \"ui\": true}"
  # }
  # entrypoint = ["ls", "-lah"]
  # cmd        = ["/data"]
  entrypoint = ["vault", "server"]
  cmd        = ["-config=/data/vault-config/server.json"]
  # entrypoint = ["sleep", "5", "&&", "vault", "server"]
  # cmd        = ["-config", "=", "/data/vault-config/server.json"]
  depends_on = [fly_app.app, fly_ip.ipv4, fly_volume.volume]
}


# $ docker run \
# --cap-add=IPC_LOCK \
# -e 'VAULT_LOCAL_CONFIG={"storage": {"file": {"path": "/data/file"}}, "listener": [{"tcp": { "address": "0.0.0.0:8200", "tls_disable": true}}], "default_lease_ttl": "168h", "max_lease_ttl": "720h", "ui": true}' 
# -p 8200:8200 vault server
