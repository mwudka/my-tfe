# terraform {
#   backend "remote" {
#     hostname = "tfe-zone-60f6da41.ngrok.io"
#     organization = "hashicorp_v2"

#     workspaces {
#       name = "my-tfe"
#     }
#   }
# }

provider "aws" {
  access_key                  = "mock_access_key"
  region                      = "us-east-1"
  s3_force_path_style         = true
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    # ec2     = "http://localhost:4597"
    ec2 = "http://localhost:9999"
  }
}

resource "aws_instance" "my-web-instance" {
  instance_type = "m5.large"
  ami = "ami-abc123"
}

# resource "random_id" "dummy-value" {
#     byte_length = 10
#     count = 2
# }

# # data "http" "slow-http-requests" {
# #     count = 1
# #     url = "https://httpbin.org/delay/10"
# # }
