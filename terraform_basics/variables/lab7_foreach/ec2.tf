resource "aws_instance" "ec2" {

  instance_type = var.instance_type_map.dev
  ami       = data.aws_ami.ec2-ami-linux.id
  user_data = file("${path.module}/startup.sh")
  key_name  = var.instance_keypair

  for_each = toset(data.aws_availability_zones.azs.names)

  availability_zone = each.key

  vpc_security_group_ids = [
    aws_security_group.ec2-ssh.id,
    aws_security_group.ec2-web.id
  ]
  tags = {
    "Name" = "ec2-demo-${each.key}"
  }
}