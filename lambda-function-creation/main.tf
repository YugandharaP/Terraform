//here 'aws' is a provider
provider "aws" {
	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region     	= "${var.region}"
	version 	= "~> 2.1"
}

/******Define Lambda function**************/
resource "aws_lambda_function" "java-based-lambda-function" {
	function_name 	= "${var.function_name}"
	s3_bucket 		= "${var.bucket_name}"
	s3_key    		= "${var.s3_key}"
	handler 		= "$var.handler}"
	runtime 		= "${var.runtime}"
	role 			= "${var.aws_iam_role_arn}"
}
















