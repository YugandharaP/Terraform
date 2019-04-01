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

/************create record set in hosted zone(A-type Aliase)***************/
resource "aws_route53_record" "recordset_A" {
	depends_on		= ["aws_cloudfront_distribution.s3_distribution"]
	zone_id 		= "${aws_route53_zone.hosted_zone.zone_id}"
	name 			= "${var.domain_name}"
	type 			= "${var.type}"

	alias {
		evaluate_target_health 	= false
		name 		= "${var.cloudfront_domain_name}"
		zone_id 	= "${var.cloudfront_hosted_zone_id}"
	}
}



