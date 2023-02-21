module "control_plane" {
  source                      = "oracle-terraform-modules/compute-instance/oci"
  compartment_ocid            = var.compartment_ocid
  instance_count              = var.instance_count
  instance_display_name       = var.instance_name
  shape                       = var.instance_shape
  source_type                 = "image"
  source_ocid                 = var.instance_image
  instance_flex_memory_in_gbs = var.instance_mem
  instance_flex_ocpus         = var.instance_cpu
  ssh_public_keys             = var.ssh_public_key
  public_ip                   = "RESERVED"
  subnet_ocids                = [var.subnet_id]
  block_storage_sizes_in_gbs  = var.instance_bootdisk_size
  user_data                   = base64encode(data.template_file.cloud_init.rendered)
}
