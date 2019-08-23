access_key 				= ""
secret_key 				= ""
region = "us-east-1"
/**************S3********************************/
website_bucket_name		= "cloudemployees.tk"
s3_origin_id			= "portfolio"
/***************CloudFront*********************************/
viewer_protocol_policy	= "redirect-to-https"
allowed_methods			= ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
cached_methods			= ["GET", "HEAD"]
is_ipv6_enabled			= "true"
aliases					= ["cloudemployees.tk"]
forward_query_string	= "false"
forward_header_values	= ["Origin"]
forward_cookies 		= ""
min_ttl					= 0
default_ttl				= 86400
max_ttl 				= 31536000
compress 				= false
price_class        		= "PriceClass_All"
geo_restriction_type 	= "none"
geo_restriction_locations = ["US", "CA", "GB", "DE"]
ssl_support_method		= "sni-only"

/**********Route53*************************/
domain_name				= "cloudemployees.tk"
type					= "A"

/**********ACM Certification****************/
acm_certificate_arn 		= ""