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

  #Optional (one or the other is required)
  # id = var.id
  # ad_number = var.ad_number
  ad_number = 1
}

data "oci_core_subnet" "subnet" {
  subnet_id = var.subnet_id
}
