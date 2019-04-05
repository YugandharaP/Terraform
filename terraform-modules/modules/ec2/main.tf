/*************create private rsa key***************/
resource "tls_private_key" "example" {
	algorithm = "${var.algorithm}"
	rsa_bits  = 4096
}
/******************creating key-pair********************/
resource "aws_key_pair" "my-key"{
	key_name 	= "${var.key_name}"
	public_key 	= "${tls_private_key.example.public_key_openssh}"
}

/*********************create ec2 instance**********************/
resource "aws_instance" "instance" { 
	ami 					= "${var.ami}" 
	instance_type 			= "${var.instance_type}" 

	#attach security-group-id
	#vpc_security_group_ids 	= ["${modules.securitygroup.aws_security_group.my_security_group.id}"]
	key_name 				= "${aws_key_pair.my-key.key_name}"
	tags{
		Name 				= "${var.tag_name}"
	}
	user_data 				= "${file(var.file)}"
	connection	={
			type		="${var.connection_type}"
			user		="${var.user}"
			private_key = "${file(var.key_path)}"
		}
}


