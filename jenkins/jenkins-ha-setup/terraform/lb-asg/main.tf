provider "aws" {
  region = "us-west-2"
}

module "lb-asg" {
  source        = "../modules/lb-asg"
  subnets       = ["subnet-0320e213c6bfc5c8b", "subnet-0c2086a918cb3783c", "subnet-0631918bf4904590e"]
  ami_id        = "ami-024cc652870b5eff9"
  instance_type = "t2.small"
  key_name      = "personal-projects-oregon"
  environment   = "dev"
  vpc_id        = "vpc-0a0167d53236f33db"
}