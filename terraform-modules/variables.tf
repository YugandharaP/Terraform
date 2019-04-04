variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

variable "bucket_name"	{}
variable "acl" {}

variable "s3_key"{}
variable "function_name"{
	description = "Create the lambda function with different names"
}
variable "handler"{
	description = "Handlers for different lambdas"
}
variable "aws_iam_role_arn"{}
variable "runtime"{}