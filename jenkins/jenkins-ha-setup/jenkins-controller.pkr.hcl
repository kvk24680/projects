variable "ami_id" {
  type    = string
  default = "ami-0735c191cf914754d"
}

variable "efs_mount_point" {
  type    = string
  default = ""
}

locals {
  app_name = "jenkins-controller-upgrade"
}

source "amazon-ebs" "jenkins" {
  ami_name      = "${local.app_name}"
  instance_type = "t2.micro"
  region        = "us-west-2"
  availability_zone = "us-west-2a"
  source_ami    = "${var.ami_id}"
  ssh_username  = "ubuntu"
#   temporary_key_pair_type = "ed25519"
  ssh_agent_auth = false
  tags = {
    Env  = "dev"
    Name = "${local.app_name}"
  }
}

build {
  sources = ["source.amazon-ebs.jenkins"]

  provisioner "ansible" {
  playbook_file = "ansible/jenkins-controller.yaml"
  extra_arguments = [ "--extra-vars", "ansible_ssh_args='-o PubkeyAcceptedKeyTypes=+ssh-rsa -o HostkeyAlgorithms=+ssh-rsa' ami-id=${var.ami_id} efs_mount_point=${var.efs_mount_point}" ]
  } 
  
  post-processor "manifest" {
    output = "manifest.json"
    strip_path = true
  }
}
