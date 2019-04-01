variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

/**************SNS*******************/
variable "topic_name"{}
variable "protocol"{}
variable "lambda_endpoint"{}