#provider here aws
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  version = "~> 2.1"
}

module "security_group"{
	source 				= "/modules/securitygroup/"
	security_group_name	= "${var.security_group_name}"
    ingress_from_port   = "${var.ingress_from_port}"
    ingress_to_port     = "${var.ingress_to_port}"
    ingress_protocol    = "${var.ingress_protocol}"
    ingress_cidr_blocks = "${var.ingress_cidr_blocks}"
	egress_from_port   	= "${var.egress_from_port}"
	egress_to_port     	= "${var.egress_to_port}"
	egress_protocol    	= "${var.egress_protocol}"
	egress_cidr_blocks 	= "${var.egress_cidr_blocks}"
}

module "iam_role"{
	source 				= "modules/iam/"
	role_name 			= "${var.role_name}"
	description 		= "${var.description}"
	assume_role_policy 	= "${var.assume_role_policy}"
	iam_policy_count 	= "${var.iam_policy_count}"
	iam_policy_arn 		= "${var.iam_policy_arn}"
}

module "ec2" {
	source 					= "modules/ec2/"
	ami 					= "${var.ami}" 
	instance_type 			= "${var.instance_type}" 
	algorithm 				= "${var.algorithm}"
	key_name 				= "${var.key_name}"
	tag_name 				= "${var.tag_name}"
	key_path 				= "${var.key_path}"
	file 					= "${var.file}"
	user 					= "${var.user}"
	connection_type 		= "${var.connection_type}"
}

module "s3"{
	source 		= "/modules/s3/"
	bucket_name	= "${var.bucket_name}"
	acl			= "${var.acl}"
	versioning 	= "${var.versioning}"
	policy 		= "${var.policy}"
	index_document 	= "${var.index_document}"
}

module "static_website_hosting"{
	source	 				= "/modules/static-website-hosting"
	bucket_id 				= "${module.s3.bucket_id}"
	object_key				= "${var.object_key}"
	upload_file_in_bucket 	= "${var.upload_file_in_bucket}"
	content_type 			= "${var.connection_type}"
	s3_origin_id 			= "${var.s3_origin_id}"
}

module "lambda"{
	source				= "/modules/lambda/"
	lambda_count 		= "${var.lambda_count}"
	bucket_name			= "${var.bucket_name}"
	function_name		= "${var.function_name}"
	handler 			= "${var.handler}"
	runtime 			= "${var.runtime}"
	s3_key				= "${var.s3_key}"
	lambda_assume_role_policy 	= "${var.lambda_assume_role_policy}"
}

module "lambda_trigger"{
	source = "modules/lambda-triggering/"
	lambda_count 		= "${var.lambda_count}"
	function_name 		= "${var.function_name}"
	filename 			= "${var.filename}"
	handler 			= "${var.handler}"
	runtime 			= "${var.runtime}"
	assume_role_policy  = "${var.assume_role_policy}"
	statement_id  		= "${var.statement_id}"
	action        		= "${var.action}"
	principal     		= "${var.principal}"
	bucket_id 			= "${module.s3.bucket_id}"
	bucket_arn    		= "${var.bucket_arn}"
	events              = "${var.events}"
	filter_prefix       = "${var.filter_prefix}"
	filter_suffix       = "${var.filter_suffix}"
}

module "dynamodb"{
	source				= "/modules/dynamodb/"
	table_name          = "${var.table_name}"
	hash_key      		= "${var.hash_key}"
	billing_mode   		= "${var.billing_mode}"
	read_capacity  		= "${var.read_capacity}"
	write_capacity 		= "${var.write_capacity}"
	type 				= "${var.type}"
	ietmsfile			= "${var.ietmsfile}"
}

module "sns" {
   source			   = "/modules/sns/"
   name    			   = "${var.name}"
   display_name        = "${var.display_name}"
   topic_arn           = "${var.topic_arn}"
   protocol            = "${var.protocol}"
   endpoint            = "${var.endpoint}"
}

module "apigateway" {
  source               	="/modules/apigateway/"
  apigateway_name      	= "${var.apigateway_name}"
  description          	= "${var.description}"
  path_part            	= "${var.path_part}"
  http_method          	= "${var.http_method}"
  authorization        	= "${var.authorization}"
  integration_http_method ="${var.integration_http_method}"
  apigateway_type      	= "${var.apigateway_type}"
  lambda_arn           	= "${var.lambda_arn}"
  mapping_template		= "${var.mapping_template}"
  statement_id         	= "${var.statement_id}"
  lambda_action        = "${var.lambda_action}"
  lambda_function_name = "${var.lambda_function_name}"
  apigateway_principal ="${var.apigateway_principal}"
  status_code          ="${var.status_code}"
  stage_name           ="${var.stage_name}"
}

module "acm"{
	source = "/modules/acm/"
	domain_name       = "${var.domain_name}"
	validation_method = "${var.validation_method}"
}

module "cloudfront" {
  source                    	= "/modules/cloudfront/"
  bucket_regional_domain_name   = "${module.static_website_hosting.bucket_regional_domain_name}"
  s3_origin_id 					= "${module.static_website_hosting.s3_origin_id}"
  enabled						= "${var.enabled}"
  is_ipv6_enabled     			= "${var.is_ipv6_enabled}"
  aliases 						= "${var.aliases}"
  viewer_protocol_policy 		= "${var.viewer_protocol_policy}"
  allowed_methods           	= "${var.allowed_methods}"
  cached_methods   		    	= "${var.cached_methods}"		
  query_string 		        	= "${var.query_string}"
  headers      		        	= "${var.headers}"
  min_ttl                   	= "${var.min_ttl}"
  default_ttl               	= "${var.default_ttl}"
  max_ttl                   	= "${var.max_ttl}"
  compress                  	= "${var.compress}"
  price_class					= "${var.price_class}"
  restriction_type 	        	= "${var.restriction_type}"
}

module "route53" {
  source			   		= "/modules/route53/"
  domain_name          		= "${var.domain_name}"
  route_type           		= "${var.route_type}"
  cloudfront_domain_name 	= "${module.cloudfront.cloudfront_domain_name}"
  cloudfront_hosted_zone_id = "${module.cloudfront.cloudfront_hosted_zone_id}"
}


