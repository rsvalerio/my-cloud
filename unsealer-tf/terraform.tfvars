app     = "unsealer"
regions = ["lhr"]
# region = "lhr"

image    = "vault:1.12.2"
cpus     = "1"
memorymb = "256"

services = [{
  ports = [{
    port     = 443
    handlers = ["tls", "http"]
    }, {
    port     = 80
    handlers = ["http"]
  }]
  "protocol" : "tcp",
  "internal_port" : 8200
}]
