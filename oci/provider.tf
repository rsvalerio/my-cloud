terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.108.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
}

# it expects a couple of `TF_VAR_*` to be defined
# or set it in a different way
provider "oci" {}
