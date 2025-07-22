variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "aws_access_key" {
  description = "Your AWS Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "Your AWS Secret Key"
  type        = string
  
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
  default     = "my-key-avi"
}

variable "docker_image_tag" {
  description = "Docker image tag (from CI pipeline)"
  type        = string
  default     = "latest"
}