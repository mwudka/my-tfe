terraform {
  required_providers {
    
  }
}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

}
