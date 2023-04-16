provider "aws" {
  region = "us-west-2"
}

module "efs_module" {
  source = "../modules/efs"
  vpc_id     = "vpc-0a0167d53236f33db"
  subnet_ids = ["subnet-0320e213c6bfc5c8b", "subnet-0c2086a918cb3783c", "subnet-0631918bf4904590e"]
}