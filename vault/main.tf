resource "oci_core_instance" "vm" {
  compartment_id      = var.compartment_ocid
  shape               = var.instance_shape
  display_name        = var.instance_name
  availability_domain = data.oci_identity_availability_domain.oad.name

  source_details {
    source_type = "image"
    source_id   = var.instance_image
    # source_id               = var.instance_image_ocid[var.region]
    # boot_volume_size_in_gbs = var.boot_volume_size_in_gbs
  }

  shape_config {
    ocpus         = var.instance_cpu
    memory_in_gbs = var.instance_mem
  }

  create_vnic_details {
    subnet_id = var.subnet_id
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    # user_data           = base64encode(file("./oci-cloud-init"))
  }

  # # Add SSH keys for access
  # ssh_authorized_keys = ["${var.public_key}"]

  # # Add a public IP
  # create_vnic_details {
  #   assign_public_ip = true
  # }
}
