variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}
variable "count"{}

variable "function_name"{
	description = "Create the lambda function with different names"
	type = "list"
}

variable "handler"{
	description = "Handlers for different lambdas"
	type = "list"
}

variable "aws_iam_role_arn"{
	type = "list"
}

variable "s3_key"{
	type = "list"
}
variable "bucket_name" {}
variable "runtime"