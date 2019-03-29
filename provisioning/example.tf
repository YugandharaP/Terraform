
#provider is aws here
provider "aws" {
  access_key = "provide your access_key"
  secret_key = "provide your secret_key"
  region     = "us-east-1"
}

#creating aws ec2 instance 
resource "aws_instance" "example" { 
	ami 					= "ami-0f9cf087c1f27d9b1" 
	instance_type 			= "t2.micro" 
	
	#using local-exec provisioner
	provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}
