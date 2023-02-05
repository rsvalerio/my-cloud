terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.104.0"
    }
  }
}

# it expects a couple of `TF_VAR_*` to be defined
# one can run `source oci_tf_vars.sh` to load the var from the file `~/.oci/config`
# or set it in a different way
provider "oci" {}
