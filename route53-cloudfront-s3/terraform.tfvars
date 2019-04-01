access_key 					= "Provide your access_key here"
secret_key 					= "Provide your secret_key here"

/**************S3********************************/
website_bucket_name			=	"cloudemployees.tk"
acl_policy					= 	"public-read"
index_document_name			=	"index.html"
versioning					= 	"true"
key							=	"index.html"
files 						=	"your file local path"
content_type				=	"text/html"
s3_origin_id				= 	"portfolio"
/***************CloudFront*********************************/
viewer_protocol_policy		= "redirect-to-https"
allowed_methods				= ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
cached_methods				= ["GET", "HEAD"]
is_ipv6_enabled				= "true"
aliases						= ["cloudemployees.tk"]
query_string				= "false"
headers						= ["Origin"]
min_ttl						= 0
default_ttl					= 86400
max_ttl 					= 31536000
compress 					= false

price_class        			= "PriceClass_All"
restriction_type 			= "none"
locations					= ["US", "CA", "GB", "DE"]
ssl_support_method			= "sni-only"

/**********Route53*************************/
domain_name					= "cloudemployees.tk"
type						= "A"

/**********ACM Certification****************/
validation_method 			= "DNS"

