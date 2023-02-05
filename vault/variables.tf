variable "config_file_profile" {
  description = "the oci config file path"
  default     = "~/.oci/config"
}

variable "instance_name" {
  description = "the name of the instance"
  default     = "vm1"
}
variable "instance_mem" {
  description = "memory_in_gbs"
  default     = "2"
}
variable "instance_bootdisk_size" {
  description = "server disk size"
  default     = "50"
}
variable "instance_cpu" {
  description = "ocpus - number of cores"
  default     = "1"
}

variable "compartment_ocid" {
  description = "the compartment-id"
  default     = "ocid1.compartment.oc1..aaaaaaaaua5ackiptuqp36kl4rvqvmepwlavec2mgwmgugika2qqarbps5la"
}

variable "instance_shape" {
  description = "the instance shape"
  default     = "VM.Standard.A1.Flex"
}

variable "instance_availability_domain" {
  description = "the availability_domain"
  default     = "AD-1"
}

variable "instance_image" {
  description = "get it from https://docs.oracle.com/en-us/iaas/images/ or list it using the cli oci compute image list  --compartment-id=$C --shape=VM.Standard.A1.Flex"
  default     = "ocid1.image.oc1.uk-london-1.aaaaaaaacd6wvghqqeocouaahlveplsl4bkutztyz6rstu5bag6limxr5rxa"
}

variable "subnet_id" {
  description = "the subnt id from oci"
  default     = "ocid1.subnet.oc1.uk-london-1.aaaaaaaaydwo2ngekni56rmmfueb7lxxh7feywb3vvcml6xpbluiecggt2rq"
}

variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqSO/d06emMJ0+YF4WjBDQpQggipAXm4voGLPH6MSI0q4iJvmCb7K4ElFJ4XY+hecW/njrbpNbU2VtXV8q33Ofe/6fFHZx+jMv2AekX6mi/Z44MLEWoo20zAA2tSCQMskIpKymNam1+HimInY3cOLCuYBX5Wo0md8K+hhgmfadq7bUJAbvPgWKr2xPDZycCLeCoqjlLYxBbr3McC4a21pGtoWaeQmHJ8ppnQ4MvNt+qHpnU936xw7IPKKPkl35egH198Mwv13bImbFthLPZ1ooIVD1LJ4beBWfox/p7XKx/yL9ucSjdv5/qHOMjuz5snBgAdKXc7q6+BL92rTG1/ISSqD3r9HcLeeYg17Gq9EMnIDSePIp25ZutBvAv6GCbMLBW9SbrlZ3ygSKt+WBqkFFICccTCSM87Fm1kWnvVvxJ03S5hSAGmoPNhYZaoaDKKhJhQvIArd56F3QnJDkFvd9OPBNReCDjuHCv8hiGJ0Quyuc1nMckLY9DOuU8GoUdNs= rsvalerio@rsvalerio-XPS-9320"
}
