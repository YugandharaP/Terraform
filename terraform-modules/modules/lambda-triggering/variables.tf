/************Lambda********************/
variable "lambda_count"{}
variable "filename"{}
variable "function_name"{
	type = "list"
}
variable "handler"{
	type = "list"
}
variable "runtime"{}
variable "assume_role_policy"{}
variable "events"{
	type = "list"
}
variable "statement_id"{}
variable "action"{}
variable "principal"{}
variable "bucket_arn"{}
variable "bucket_id"{}
variable "filter_prefix"{}
variable "filter_suffix"{}