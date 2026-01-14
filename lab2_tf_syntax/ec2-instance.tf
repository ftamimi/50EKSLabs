terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

resource "aws_instance" "first-ec2" {
  instance_type = "t4g.micro"
  ami           = "ami-07c19991d2b65ffe0"

}