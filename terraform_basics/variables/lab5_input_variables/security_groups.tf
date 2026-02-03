# SSH traffic

resource "aws_security_group" "ec2-ssh" {
  name        = "ec2-ssh"
  description = "Allow SSH inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ec2-ssh_ipv4" {
  security_group_id = aws_security_group.ec2-ssh.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ec2-ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# Web traffic

resource "aws_security_group" "ec2-web" {
  name        = "ec2-web"
  description = "Allow web inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ec2-web_ipv4" {
  security_group_id = aws_security_group.ec2-web.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "ec2-web_ipv4" {
  security_group_id = aws_security_group.ec2-web.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ec2-web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
