/**************Create Hosted Zone(route53)**************/
resource "aws_route53_zone" "hosted_zone" {
  name 			= "${var.domain_name}"
  
}

output "zone_id" {
  value =  "${aws_route53_zone.hosted_zone.zone_id}"
}

/************create record set in hosted zone(A-type Aliase)***************/
resource "aws_route53_record" "recordset_A" {
	zone_id 		= "${aws_route53_zone.hosted_zone.zone_id}"
	name 			= "${var.domain_name}"
	type 			= "${var.route_type}"
	alias {
		evaluate_target_health 	= false
		name 		= "${var.cloudfront_domain_name}"
		zone_id 	= "${var.cloudfront_hosted_zone_id}"
	}
}
