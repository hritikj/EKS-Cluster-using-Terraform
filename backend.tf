terraform {
  backend "s3" {
    bucket         = "eks-game-terraform-state"
    key            = "eks-game/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "eks-game-terraform-lock"
    encrypt        = true
  }
}
