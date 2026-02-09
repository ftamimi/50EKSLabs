resource "aws_instance" "ec2" {
  instance_type = var.instance_type
  ami           = data.aws_ami.ec2-ami-linux.id
  user_data     = file("${path.module}/startup.sh")
  key_name      = var.instance_keypair

  vpc_security_group_ids = [
    aws_security_group.ec2-ssh.id,
    aws_security_group.ec2-web.id
  ]
  tags = {
    "Name" = "ec2-demo"
  }
}