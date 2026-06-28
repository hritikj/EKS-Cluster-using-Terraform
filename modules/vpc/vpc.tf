module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.1"

  name            = "eks-vpc"
  cidr            = "192.168.1.0/24"
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["192.168.1.0/27", "192.168.1.32/27"]
  public_subnets  = ["192.168.1.64/26", "192.168.1.128/26"]

  enable_nat_gateway = false
  enable_vpn_gateway = true
}
