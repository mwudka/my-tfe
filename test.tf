terraform {
  backend "remote" {
    hostname = "tfe-zone-60f6da41.ngrok.io"
    organization = "hashicorp_v2"

    workspaces {
      name = "scm-testing"
    }
  }
}

resource "random_id" "dummy-value" {
    byte_length = 10
    count = 200
}

data "http" "slow-http-requests" {
    count = 5
    url = "https://httpbin.org/delay/10"
}
