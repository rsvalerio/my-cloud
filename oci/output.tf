output "private_ip" {
  value = module.control_plane.private_ip
}
output "public_ip" {
  value = module.control_plane.public_ip
}
output "region" {
  value = module.control_plane.instance_all_attributes[0].region
}
