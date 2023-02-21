# data "oci_identity_compartment" "test_compartment" {
#     #Required
#     id = var.compartment_id
# }
# resource "oci_secrets_secret_bundle" "public_key" {
#   compartment_id = "${var.compartment_ocid}"
#   secret_content = "${var.public_key}"
# }

data "oci_identity_availability_domain" "oad" {
  #Required
  compartment_id = var.compartment_ocid
  ad_number      = 1
}

data "oci_core_subnet" "subnet" {
  subnet_id = var.subnet_id
}

# Template for initial configuration bash script
data "template_file" "cloud_init" {
  template = file("cloud-init.yaml.tpl")
  vars = {
    instance_role = var.instance_role
  }
}
