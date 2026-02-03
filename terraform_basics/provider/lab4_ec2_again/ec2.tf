resource "aws_instance" "ec2" {
  instance_type = "t4g.micro"
  ami           = "ami-07c19991d2b65ffe0"
  user_data     = file("${path.module}/startup.sh")
  tags = {
    "Name" = "ec2-demo"
  }
}