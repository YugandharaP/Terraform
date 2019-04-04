#provider here aws
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  version = "~> 2.1"
}


module "s3_bucket_creation"{
	source 		= "/modules/s3/"
	bucket_name	= "${var.bucket_name}"
	acl			= "${var.acl}"
}


module "lambda_creation"{
	source				= "/modules/lambda/"
	bucket_name			= "${var.bucket_name}"
	function_name		= "${var.function_name}"
	handler 			= "${var.handler}"
	runtime 			= "${var.runtime}"
	s3_key				= "${var.s3_key}"
	aws_iam_role_arn 	= "${var.aws_iam_role_arn}"
	
}


