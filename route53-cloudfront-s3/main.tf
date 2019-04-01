provider "aws" {
	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region     	= "${var.region}"
	version 	= "~> 2.1"
}

/**********S3 bucket creation******************/
resource "aws_s3_bucket" "static_website_hosting"{
	bucket	=	"${var.website_bucket_name}"
	acl		=	"${var.acl_policy}"
	policy	=	"${file("policy.json")}"
	
	website {
		index_document = "${var.index_document_name}"
	}
	versioning {
		enabled = "${var.versioning}"
	}
}

/**************upload file in S3 bucket***********/
resource "aws_s3_bucket_object" "html-files" {
	depends_on		= ["aws_s3_bucket.static_website_hosting"]
	bucket 			= "${var.website_bucket_name}"
	key    			= "${var.key}"
	source 			= "${var.files}"
	content_type 	= "${var.content_type}"
}

locals {
  s3_origin_id 		= "${var.s3_origin_id}"
}

/******************ACM Certificate creation***********************************/
resource "aws_acm_certificate" "certificate" {
  domain_name       = "${var.domain_name}"
  validation_method = "${var.validation_method}"
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
		query_string 		= "${var.query_string}"
		headers      		= "${var.headers}"
		cookies {
			forward 		= "none"
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
		restriction_type 	= "${var.restriction_type}"
		//locations        	= "${var.locations}"
    }
  }
   viewer_certificate {
		//cloudfront_default_certificate = true
		ssl_support_method 	= "${var.ssl_support_method}"
		acm_certificate_arn = "${aws_acm_certificate.certificate.arn}"
  }
}



