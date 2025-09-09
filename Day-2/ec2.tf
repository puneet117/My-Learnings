#AWS_KEY_PAIR
resource "aws_key_pair" "deployer" {
  key_name   = "terraform-tws-key"
  public_key = file("terraform-tws-key.pub")

}

#VPC & Security Group
resource "aws_default_vpc" "default" {}
resource "aws_security_group" "name" {
  name        = "automated-sg"
  description = "created by terraform"
  vpc_id      = aws_default_vpc.default.id #interpolation

  #ingress rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH from anywhere"
  }
  #ingress rule
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP from anywhere"
  }

  #ingress rule
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Flask App"
  }

  #egress rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  tags = {
    Name        = "automated-sg"
    Environment = "Dev"
    Owner       = "Puneet"
    Project     = "Terraform"
    Purpose     = "Learning"
  }

}

#ec2 instance
resource "aws_instance" "web" {
  #count = 2 #meta-argument for creating multiple instances
  for_each = tomap({
    Terraform-Automate-micro = "t2.micro"
    Terraform-Automate-small = "t2.small"
  })
  ami             = var.ec2_ami_id
  instance_type   = each.value
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.name.name] #interpolation

  tags = {
    Name        = each.key
    Environment = "Dev"
    Owner       = "Puneet"
    Project     = "Terraform"
    Purpose     = "Learning"
  }

  root_block_device {
    volume_size = var.aws_root_volume_size
    volume_type = "gp3"
  }

  user_data = file("install_nginx.sh") #for installing nginx

}