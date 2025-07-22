provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Use latest Ubuntu 22.04 LTS AMI
data "aws_ami" "ubuntu_jammy" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Security Group
resource "aws_security_group" "strapi_sg" {
  name_prefix = "strapi-sg-"
  description = "Allow inbound traffic on port 1337 and SSH (22)"

  ingress {
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "strapi_ec2" {
  ami                    = data.aws_ami.ubuntu_jammy.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.strapi_sg.id]

  user_data = templatefile("${path.module}/user_data.sh", {
    docker_tag = var.docker_image_tag
  })

  tags = {
    Name = "Strapi-EC2-Aviral"
  }
}

# Output Public IP
output "ec2_public_ip" {
  description = "Public IP of the Strapi EC2 instance"
  value       = aws_instance.strapi_ec2.public_ip
}
