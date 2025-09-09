variable "aws_instance_type" {
  default = "t2.micro"
  type    = string
}

variable "aws_default_root_volume_size" {
  default = 15
  type    = number
}

variable "ec2_ami_id" {
  default = "ami-0cfde0ea8edd312d4" #Ubuntu Server 22.04 LTS (HVM), SSD Volume Type - us-east-2
  type    = string
}

variable "env" {
  default = "Dev"
  type    = string
}