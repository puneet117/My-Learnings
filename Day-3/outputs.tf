#Outputs for count

# output "ec2_public_ip" {
#   value       = aws_instance.web[*].public_ip
#   description = "Public IP of the EC2 instance"
# }

# output "ec2_public_dns" {
#   value       = aws_instance.web[*].public_dns
#   description = "Public DNS of the EC2 instance"
# }

# output "ec2_private_ip" {
#   value       = aws_instance.web[*].private_ip 
#   description = "Private IP of the EC2 instance"

# }

#Outputs for for_each
output "ec2_public_ip" {
  value       = [for instance in aws_instance.web : instance.public_ip]
  description = "Public IPs of the EC2 instances"
}

output "ec2_public_dns" {
  value       = [for instance in aws_instance.web : instance.public_dns]
  description = "Public DNSs of the EC2 instances"

}

output "ec2_private_ip" {
  value       = [for instance in aws_instance.web : instance.private_ip]
  description = "Private IPs of the EC2 instances"

}