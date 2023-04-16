provider "aws" {
  region = "us-west-2"
}

module "ec2_instance" {
  source = "../modules/ec2"

  instance_name      = "jenkins-agent"
  ami_id             = "ami-0b038ead94fa02dbc"
  instance_type      = "t2.small"
  key_name           = "personal-projects-oregon"
  subnet_ids         = ["subnet-0320e213c6bfc5c8b", "subnet-0c2086a918cb3783c", "subnet-0631918bf4904590e"]
  instance_count     = 1
}
