variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

variable "function_name"{
	description = "Create the lambda function with different names"
}
variable "handler"{
	description = "Handlers for different lambdas"
}

variable "s3_key"{}
variable "bucket_name" {}
variable "runtime"