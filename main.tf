module "vpc" {
  source  = "./modules/vpc"
}

module "eks" {
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets
  source  = "./modules/eks"
}


module "ecr" {
  source = "./modules/ecr"
}
