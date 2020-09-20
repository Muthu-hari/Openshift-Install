provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "Openshift" {
  count = var.instance_count

  ami              = var.ami
  instance_type    = var.instance_type
  tags {
    Name = "Openshift_instance"
	
	}
}
