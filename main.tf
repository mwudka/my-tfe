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

    tfe = {
      source = "hashicorp/tfe"
      version = "0.39.0"
    }
  }
}

output "foo" {
  value = "bar"
}
