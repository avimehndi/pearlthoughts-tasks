variable "docker_image_tag" {
  description = "Docker image tag to deploy"
  type        = string
}

output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.strapi_server.public_ip
}
