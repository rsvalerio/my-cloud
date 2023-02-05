packer {
  required_plugins {
    oracle = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/oracle"
    }
  }
}

variable "base_image_ocid" {
  type    = string
  default = "ocid1.image.oc1.iad.aaaaaaaaxclcbh3agythoi7crfs4hi7kazukq2tbtt3nciikr3mwbgt7ddfq"
}

variable "region" {
  type    = string
  default = "us-ashburn-1"
}

variable "subnet_ocid" {
  type    = string
  default = "ocid1.subnet.oc1.iad.aaaaaaaamva6sl7s6hq2of4ehc5tg5kd3cdeltkb3vapzk6im3cadk4f6tba"
}

variable "availability_domain" {
  type = string
}

variable "shape" {
  type    = string
  default = "VM.Standard1.1"
}

variable "site" {
  type = string
}

variable "ubuntu_release" {
  type    = string
  default = "focal"
}

variable "ubuntu_version" {
  type    = string
  default = "20.04"
}

locals {
  compartment_ocid = vault("/infraops-squad/infra-as-code/oracle", "compartment_ocid")
}

locals {
  fingerprint = vault("/infraops-squad/infra-as-code/oracle", "fingerprint")
}

locals {
  tenancy_ocid = vault("/infraops-squad/infra-as-code/oracle", "tenancy_ocid")
}

locals {
  user_ocid = vault("/infraops-squad/infra-as-code/oracle", "user_ocid")
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "oracle-oci" "telnyx_image" {
  availability_domain = "${var.availability_domain}"
  base_image_ocid     = "${var.base_image_ocid}"
  compartment_ocid    = "${local.compartment_ocid}"
  fingerprint         = "${local.fingerprint}"
  image_name          = "infra-mi-ubuntu-focal-${local.timestamp}"
  key_file            = "~/.oci/oci_api_key.pem"
  region              = "${var.region}"
  shape               = "${var.shape}"
  ssh_username        = "ubuntu"
  subnet_ocid         = "${var.subnet_ocid}"
  tenancy_ocid        = "${local.tenancy_ocid}"
  use_private_ip      = "true"
  user_ocid           = "${local.user_ocid}"
}

build {
  sources = ["source.oracle-oci.telnyx_image"]

  provisioner "shell" {
    inline = [
      "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'waiting for cloud-init...'; sleep 2; done",
    ]
  }
  provisioner "shell" {
    script = "./packer/scripts/prepare.sh"
  }
  provisioner "file" {
    destination = "/tmp"
    source      = "./packer/ansible"
  }
  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{ .Vars }} sudo -S -E sh -eux '{{ .Path }}'"
    inline = [
      "mv /tmp/ansible /opt && cd /opt/ansible && make env && make prepare VM_PROVIDER=oci",
    ]
  }
  provisioner "shell" {
    script = "./packer/scripts/finish.sh"
  }

  post-processors {
    post-processor "manifest" {
      output     = "./oracle.json"
      strip_path = true
      custom_data = {
        ubuntu_release = "${var.ubuntu_release}"
        ubuntu_version = "${var.ubuntu_version}"
        provider       = "oci"
        site           = "${var.site}"
      }
    }
  }
}
