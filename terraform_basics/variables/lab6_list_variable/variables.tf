
variable "aws_region" {
  default     = "eu-west-2"
  type        = string
  description = "AWS main region"
}

variable "instance_type" {
  default     = "t4g.micro"
  type        = string
  description = "The instance type we are going to use"
}

variable "instance_keypair" {
  default     = "terraform-labs"
  type        = string
  description = "AWS EC2 Key Pair"
}

variable "instance_type_list" {
  description = "EC2 instance list"
  type        = list(string)
  default = [
    "t4g.micro",
    "t4g.small",
    "t4g.medium"
  ]

}

variable "instance_type_map" {
  description = "EC2 instance map"
  type        = map(string)
  default = {
    "dev"  = "t4g.micro"
    "uat"  = "t4g.small"
    "prod" = "t4g.medium"
  }

}