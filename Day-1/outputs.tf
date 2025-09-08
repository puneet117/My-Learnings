output "ec2_public_ip" {
  value       = aws_instance.web.public_ip
  description = "Public IP of the EC2 instance"
}

output "ec2_public_dns" {
  value       = aws_instance.web.public_dns
  description = "Public DNS of the EC2 instance"
}

output "ec2_private_ip" {
  value       = aws_instance.web.private_ip
  description = "Private IP of the EC2 instance"

}