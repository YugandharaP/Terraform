#aws provider here 
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

/********************create private rsa key*****************/
resource "tls_private_key" "example" {
	algorithm = "${var.algorithm}"
	rsa_bits  = 4096
}

/*******************creating key-pair*************************/
resource "aws_key_pair" "terraform-common-key"{
	key_name 	= "${var.key_name}"
	public_key 	= "${tls_private_key.example.public_key_openssh}"
}

/*****************creating ec2 instance******************/
resource "aws_instance" "instance" { 
	ami 					= "${var.ami}" 
	instance_type 			= "${var.instance_type}" 
	key_name 				= "${aws_key_pair.terraform-common-key.key_name}"
	user_data = "${file("install_softwares.sh")}"
	tags = {
		Name 				= "terraform-common"
	}
}

