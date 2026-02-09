resource "aws_instance" "ec2" {

  # original
  # instance_type = var.instance_type
  # list
  # instance_type = var.instance_type_list[1]
  # map
  instance_type = var.instance_type_map.dev
  # or
  # instance_type = var.instance_type_map["prod"]

  # replicas
  count = 2

  ami       = data.aws_ami.ec2-ami-linux.id
  user_data = file("${path.module}/startup.sh")
  key_name  = var.instance_keypair

  vpc_security_group_ids = [
    aws_security_group.ec2-ssh.id,
    aws_security_group.ec2-web.id
  ]
  tags = {
    "Name" = "ec2-demo-${count.index}"
  }
}