# for loops

# for loop on list
output "list_for_loop" {
  description = "output for loop for List"
  value = [
    for instance in aws_instance.ec2: instance.public_dns
  ]
}

# for loop on map - the => is for for each instance id, produce public_dns
output "map_for_loop" {
  description = "output for loop with Map"
  value = {
    for instance in aws_instance.ec2: instance.id => instance.public_dns
  }
}

# for loop on map - advanced, for each count i.e. the c what is the public dns
output "map_for_loop_advanced" {
  description = "output for loop with Map - Advanced"
  value = {
    for c, instance in aws_instance.ec2: c => instance.public_dns
  }
}

# legacy splat - instead of the single operator - use * for count
output "legacy_splat_public_dns" {
    description = "output fot the legacy splat"
    value = aws_instance.ec2.*.public_dns
}

# modern splat - instead of the single operator - use * for count
output "splat_public_dns" {
    description = "output fot the general splat"
    value = aws_instance.ec2[*].public_dns
}
