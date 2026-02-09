output "ec2_publicip" {
  description = "EC2 public IP"
  value = aws_instance.ec2.public_ip
}

output "ec2_publicdns" {
  description = "EC2 public DNS"
  value = aws_instance.ec2.public_dns
}