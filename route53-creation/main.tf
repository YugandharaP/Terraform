provider "aws" {
	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region     	= "${var.region}"
	version 	= "~> 2.1"
}

/**************Create Hosted Zone(route53)**************/
resource "aws_route53_zone" "hosted_zone" {
  name = "${var.domain_name}"
}





