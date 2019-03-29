provider "aws" {
	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region     	= "${var.region}"
	version 	= "~> 2.1"
}

/******Create Multiple Lambda function**************/
resource "aws_lambda_function" "java-based-lambda-function" {
	count			= "${var.count}"
	function_name 	= "${element(var.function_name, count.index)}"
	s3_bucket 		= "${var.bucket_name}"
	s3_key    		= "${element(var.s3_key, count.index)}"
	handler 		= "${element(var.handler, count.index)}"
	runtime 		= "${var.runtime}"
	role 			= "${element(var.aws_iam_role_arn, count.index)}"
}
















