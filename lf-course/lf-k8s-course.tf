variable "region" {
  type = string
  default = "us-east-1"
}

variable "ami" {
  default = "ami-0739f8cdb239fe9ae"
}

variable "aws_instance_type" {
  default = "m5a.large"
}

provider "aws" {
  profile = "terraform-learner"
  version = "2.65.0"
  region = var.region
}

// Use the default VPC provided by AWS for the beginning
resource "aws_default_vpc" "default" {}

resource "aws_instance" "master" {
  //  count = 2
  ami = var.ami
  instance_type = var.aws_instance_type

  # root disk
  root_block_device {
    volume_size = "20"
    volume_type = "gp2"
    encrypted = false
    delete_on_termination = true
  }

  tags = {
    Name = "linux-foundation-k8s-class"
    // Indicate that this resouce is managed by Terraform
    // (alternatively one might include "launched by Terraform" in the name):
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "dev_lf_class" {
  name = "dev_lf_class"
  description = "Allow standard http and https ports inbound and everything outbound"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags {
    "Terraform" = "true"
  }
}

output "instance-dns" {
  value = aws_instance.master.public_dns
}