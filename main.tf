terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

resource "random_id" "server" {
    byte_length = 8
}

output "random_hex" {
  value = random_id.server.hex
}
