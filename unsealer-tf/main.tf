resource "fly_app" "app" {
  name = var.app
}

resource "fly_ip" "ipv4" {
  app        = var.app
  type       = "v4"
  depends_on = [fly_app.app]
}
