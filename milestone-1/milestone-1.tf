# data "aws_ami" "ubuntu"
data "aws_ami" "ubuntu" {
  most_recent = true

  # Sets filter to select all AMI's with name matching
  # the regular expression:
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  # The canonical Ubuntu AWS account id:
  owners = ["099720109477"]
}


provider "aws" {
  # The lastest version as of today
  # (according to https://registry.terraform.io/providers/hashicorp/aws/latest)
  version="3.39.0"
  profile="terraform-learner"
  region = "us-east-1"
}

resource "aws_instance" "helloworld" {
  # Use Ubuntu AMI (Amazon Machine Image):
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    # What is the name of this resource?
    Name = "Hello World"
    # Is this resource managed by Terraform?
    Terraform = "true"
  }
}