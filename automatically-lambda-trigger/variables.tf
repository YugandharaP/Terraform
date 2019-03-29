variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

/***********S3****************/
variable "bucket_name"{}
variable "acl_policy"{}
variable "versioning"{}
variable "key"{}
variable "files"{}
variable "content_type"{}

/***********IAM***********************/
variable "iam_role_name"{}
variable "count"{}
variable "iam_policy_arn"{
type = "list"
}

/************Lambda********************/
variable "filename"{}
variable "function_name"{}
variable "handler"{}
variable "runtime"{}

variable "events"{

type = "list"
}

variable "statement_id"{}
variable "action"{}
variable "principal"{}
variable "filter_prefix"{}
variable "filter_suffix"{}