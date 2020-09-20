variable "aws_region" {
  type = string
  default = "us-east-2"
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
