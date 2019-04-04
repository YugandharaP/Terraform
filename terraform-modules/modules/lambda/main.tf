/******Define Lambda function**************/
resource "aws_lambda_function" "java-based-lambda-function" {
	function_name 	= "$var.function_name}"
	s3_bucket 		= "${var.bucket_name}"
	s3_key    		= "${var.s3_key}"
	handler 		= "${var.handler}"
	runtime 		= "${var.runtime}"
	role 			= "${var.aws_iam_role_arn}"
}
















