
#provider is aws here
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

#creating aws ec2 instance 
resource "aws_instance" "example" { 
	ami 					= "${var.ami}" 
	instance_type 			= "t2.micro" 
}

