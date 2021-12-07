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

variable "pet_name_length" {
  default = "default pet_name_length"
}
variable "example" {
  default = "default example"
}

variable "example_var" {
  default = "default hcl_example_var"
}
data "http" "random" {
  url = "https://app.terraform.io/app/organizations"
}

locals {
  random_uuid = data.http.random.response_headers["X-Request-Id"]
}

resource "random_id" "server" {
  byte_length = 8

  keepers = {
    "uuid" = local.random_uuid
  }
}

output "random_hex" {
  value = random_id.server.hex
}

output "random_http_uuid" {
  value = local.random_uuid
}

output "pet_name_length" {
  value = var.pet_name_length
}

output "example" {
  value     = var.example
  sensitive = true
}

output "hcl_example_var" {
  value = var.example_var
}

data "environment_variables" "all" {}

output "env-vars" {
  value = data.environment_variables.all.items
}
