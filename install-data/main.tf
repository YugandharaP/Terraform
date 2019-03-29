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
		Name 				= "${var.tag_name}"
	}
	user_data 				= "${file("install_apache.sh")}"
	provisioner "remote-exec"{
	/******************************
        inline = [
			"export PATH=$PATH:/usr/bin",
			# install java 8
			"sudo add-apt-repository -y ppa:webupd8team/java",
			"sudo apt-get update",
			"sudo apt-get -y install oracle-java8-installer",
			"export JAVA_HOME=/usr/lib/jvm/java-8-oracle",
			"sudo apt-get update",
			"echo $JAVA_HOME",
			"sudo apt-get update",
			"sudo apt-get install -y apache2",
			"sudo systemctl start apache2",
			"sudo systemctl enable apache2",
			"echo $<h1>Deployed via Terraform</h1>", 
			"sudo tee /var/www/html/index.html"
		]
    *****************************************/
	connection	={
			type		="${var.connection_type}"
			user		="${var.user}"
			private_key = "${file(var.key_path)}"
		}
	}
}

