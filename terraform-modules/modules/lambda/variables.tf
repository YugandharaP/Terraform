variable "bucket_name"{}
variable "s3_key"{}
variable "function_name"{
	description = "Create the lambda function with different names"
}
variable "handler"{
	description = "Handlers for different lambdas"
}
variable "aws_iam_role_arn"{}
variable "runtime"{}