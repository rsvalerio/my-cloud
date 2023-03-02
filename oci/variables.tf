variable "config_file_profile" {
  description = "the oci config file path"
}

variable "instance_name" {
  description = "the name of the instance"
}
variable "instance_mem" {
  description = "memory_in_gbs"
}
variable "instance_bootdisk_size" {
  description = "server disk size"
}
variable "instance_cpu" {
  description = "ocpus - number of cores"
}

variable "compartment_ocid" {
  description = "the compartment-id"
}

variable "instance_shape" {
  description = "the instance shape"
}

variable "instance_availability_domain" {
  description = "the availability_domain"
}

variable "instance_image" {
  description = "get it from https://docs.oracle.com/en-us/iaas/images/ or list it using the cli oci compute image list  --compartment-id=$C --shape=VM.Standard.A1.Flex"
}

variable "subnet_id" {
  description = "the subnt id from oci"
}

variable "ssh_public_key" {
  description = "ssh public key string"
}

variable "instance_count" {
  description = "total number of instances to create"
  default = 1
}
variable "instance_role" {
  description = "k8s-control-plane|k8s-node"
  default = "compute"
}
