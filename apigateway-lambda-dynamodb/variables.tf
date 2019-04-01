variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

/****************S3*************************/
variable "acl"{}
variable "key"{}
variable "files" {}
variable "bucket_name"{}
variable "content_type"{}

/*************IAM-Role**********************/
variable "iam_role_name"{}

/**************Lambda***********************/
variable "function_name"{}
variable "s3_key"{}
variable "handler"{}
variable "runtime"{}
variable "lambda_arn"{}
variable "statement_id"{}
variable "action"{}
variable "function_name"{}

/***************APIGatewy*******************/
variable "apigateway_name"{}
variable "path_part"{}
variable "http_method"{}
variable "authorization"{}
variable "integration_http_method"{}
variable "integration_type"{}
variable "stage_name"{}
