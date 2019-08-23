provider "aws" {
	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region     	= "${var.region}"
}

/**********S3 bucket creation******************/
resource "aws_s3_bucket" "static_website_hosting"{
	bucket	=	"${var.website_bucket_name}"
}

locals {
  s3_origin_id 		= "${var.s3_origin_id}"
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
		name 		= "${aws_cloudfront_distribution.s3_distribution.domain_name}"
		zone_id 	= "${aws_cloudfront_distribution.s3_distribution.hosted_zone_id}"
	}
}

/***************create cloudfront distribution*****************/
resource "aws_cloudfront_distribution" "s3_distribution" {
//origin settings
  origin {
		domain_name 		= "${aws_s3_bucket.static_website_hosting.bucket_regional_domain_name}"
		origin_id   		= "${local.s3_origin_id}"
  }

//Distribution Settings
 enabled					= true
 is_ipv6_enabled     		= "${var.is_ipv6_enabled}"
 aliases 					= "${var.aliases}"
 
//Cache Behavior 
  default_cache_behavior {
		viewer_protocol_policy 	= "${var.viewer_protocol_policy}"
		allowed_methods  		= "${var.allowed_methods}"
		cached_methods   		= "${var.cached_methods}"
		target_origin_id		= "${local.s3_origin_id}"
		
    forwarded_values {
		query_string 		= "${var.forward_query_string}"
		headers      		= "${var.forward_header_values}"
		cookies {
			forward 		= "${var.forward_cookies}"
		}
    }
    min_ttl                = "${var.min_ttl}"
    default_ttl            = "${var.default_ttl}"
    max_ttl                = "${var.max_ttl}"
    compress               = "${var.compress}"
  }

//Distribution Settings
	price_class				= "${var.price_class}"
 
restrictions {
    geo_restriction {
		restriction_type 	= "${var.geo_restriction_type}"
		//locations        	= "${var.geo_restriction_locations}"
    }
  }
   viewer_certificate {
		//cloudfront_default_certificate = true
		ssl_support_method 	= "${var.ssl_support_method}"
		acm_certificate_arn = "${var.acm_certificate_arn}"
  }
}
