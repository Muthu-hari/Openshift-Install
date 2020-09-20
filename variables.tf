variable "aws_access_key" {
  type = string
  description = "AWS access key"
}

variable "aws_secret_key" {
  type = string
  description = "AWS secret key"
}

variable "aws_region" {
  type = string
  description = "AWS region"
}

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 3
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "ami-ebd02392"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}
