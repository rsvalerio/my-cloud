resource "fly_volume" "volume" {
  for_each = toset(var.regions)
  region   = each.key
  name     = "${each.key}_${var.app}_vol"
  app      = var.app
  size     = 1
}
