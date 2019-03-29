
#provider is aws here
provider "aws" {
  access_key = "provide your access_key here"
  secret_key = "provide your secret_key here"
  region     = "us-east-1"
}

#creating aws ec2 instance 
resource "aws_instance" "example" { 
	ami 					= "ami-0f9cf087c1f27d9b1" 
	instance_type 			= "t2.micro" 
	
	# Tells Terraform that this EC2 instance must be created only after the
	# S3 bucket has been created.
	
	depends_on = ["aws_s3_bucket.example"]
}

/******implicit dependency*********/

#creating aws-elastic-ip
resource "aws_eip" "ip" {
    instance = "${aws_instance.example.id}"
}

/******explicit dependency*********/
resource "aws_s3_bucket" "example" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
  bucket = "terraform-demo"
  acl    = "private"
}