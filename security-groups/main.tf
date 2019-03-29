#aws provider here 
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

#creating security-group here
resource "aws_security_group" "my_security_group" {
  name = "${var.security_group_name}"
  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
  }
 }

#create private rsa key
resource "tls_private_key" "example" {
	algorithm = "${var.algorithm}"
	rsa_bits  = 4096
}

#creating key-pair
resource "aws_key_pair" "my-key"{
	key_name 	= "${var.key_name}"
	public_key 	= "${tls_private_key.example.public_key_openssh}"
}

#create ec2 instance
resource "aws_instance" "instance" { 
	ami 					= "${var.ami}" 
	instance_type 			= "${var.instance_type}" 
	
	#attach security-group-id
	vpc_security_group_ids 	= ["${aws_security_group.my_security_group.id}"]
	key_name 				= "${aws_key_pair.my-key.key_name}"
	tags{
		Name 				= "instance_name"
	}
}

