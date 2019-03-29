provider "aws" {
	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region     	= "${var.region}"
	version 	= "~> 2.1"
}

/***********Define IAM Role********************/
resource "aws_iam_role" "lambda_basic_exec" {
	name 				= "${var.role_name}"
	description 		= "${description}"
	assume_role_policy 	= "${file("assumerolepolicy.json")}
}