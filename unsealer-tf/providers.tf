terraform {
  required_providers {
    fly = {
      source  = "fly-apps/fly"
      version = "0.0.20"
    }
  }

  backend "remote" {
    organization = "my-cloud-org"
    workspaces {
      name = "my-cloud"
    }
  }

}
provider "fly" {}
