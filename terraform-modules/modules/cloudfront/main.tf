/***************create cloudfront distribution*****************/

resource "aws_cloudfront_distribution" "s3_distribution" {
//origin settings
  origin {
		domain_name 		= "${var.bucket_regional_domain_name}"
		origin_id   		= "${var.s3_origin_id}"
  }

//Distribution Settings
 
 enabled					= "${var.enabled}"
 is_ipv6_enabled     		= "${var.is_ipv6_enabled}"
 aliases 					= "${var.aliases}"

 //Cache Behavior 
  
  default_cache_behavior {
		viewer_protocol_policy 	= "${var.viewer_protocol_policy}"
		allowed_methods  		= "${var.allowed_methods}"
		cached_methods   		= "${var.cached_methods}"
		target_origin_id		= "${var.s3_origin_id}"
	
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
    }
  }
   viewer_certificate {
		cloudfront_default_certificate = true
		//ssl_support_method 	= "${var.ssl_support_method}"
		//acm_certificate_arn 	= "${var.acm_certificate_arn}"
  }
}

output "cloudfront_domain_name" {
  value = "${aws_cloudfront_distribution.s3_distribution.domain_name}"
}

output "cloudfront_hosted_zone_id" {
  value = "${aws_cloudfront_distribution.s3_distribution.hosted_zone_id}"
}
