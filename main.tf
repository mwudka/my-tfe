terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "2.1.0"
    }
    environment = {
      source  = "EppO/environment"
      version = "1.1.0"
    }
  }
}

variable "my-var" {
  default = "default-value"
}

data "http" "random" {
  url = "http://www.randomnumberapi.com/api/v1.0/uuid"

}
resource "random_id" "server" {
  byte_length = 8

  keepers = {
    "uuid" = data.http.random.body
  }
}

output "random_hex" {
  value = random_id.server.hex
}

output "random_http_uuid" {
  value = data.http.random.body
}

output "var-value" {
  value = var.my-var
}

data "environment_variables" "all" {}

output "env-vars" {
  value = data.environment_variables.all.items
}