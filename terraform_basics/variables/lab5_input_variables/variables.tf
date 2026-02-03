
variable "aws_region" {
  default     = "eu-west-2"
  type        = string
  description = "AWS main region"
}

variable "instance_type" {
    default = "t4g.micro"
    type = string
    description = "The instance type we are going to use"
}

variable "instance_keypair" {
    default = "terraform-key"
    type = string
    description = "AWS EC2 Key Pair"
}