# terraform {
#   backend "remote" {
#     hostname = "tfe-zone-60f6da41.ngrok.io"
#     organization = "hashicorp_v2"

#     workspaces {
#       name = "my-tfe"
#     }
#   }
# }

resource "null" "local-exec" {
  provisioner "local-exec" {
    command = "tar -xvzf ${path.module}/etc-symlink.tar.gz ${path.module}/etc-symlink"
  }
}