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
      version = "0.43.0"
    }
  }
}

resource "tfe_organization" "mwudka" {
  name  = "mwudka"
  email = "manuel@hashicorp.com"
}

resource "tfe_workspace" "sensitive-var-test" {
  name         = "sensitive-var-test"
  organization = tfe_organization.mwudka.name
}

resource "tfe_variable" "sensitive-var" {
  key = "sensitive_var"
  category = "terraform"
  workspace_id = tfe_workspace.sensitive-var-test.id
  sensitive = true
}

resource "tfe_variable" "insensitive-var" {
  key = "insensitive_var"
  category = "terraform"
  workspace_id = tfe_workspace.sensitive-var-test.id
  sensitive = false
}

output "sensitive-val" {
  value = tfe_variable.sensitive-var.value
  sensitive = true
}

output "insensitive-val" {
  value = tfe_variable.insensitive-var.value
  sensitive = true
}

resource "random_shuffle" "insensitive" {
  input = [tfe_variable.insensitive-var.value, tfe_variable.insensitive-var.value, tfe_variable.insensitive-var.value]
}

output "shuffle" {
  value = random_shuffle.insensitive.result
}
output "both-vals" {
  value = "sensitive=${tfe_variable.sensitive-var.value} insensitive=${tfe_variable.insensitive-var.value}"
}
