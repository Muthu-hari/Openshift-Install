provider "aws" {
  region     = var.aws_region
}

resource "aws_instance" "Openshift" {
  count = var.instance_count

  ami              = var.ami
  instance_type    = var.instance_type
  tags {
    Name = "Openshift_instance"
	
	}
}
