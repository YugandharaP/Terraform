variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}
/***********DynamoDB****************/
variable "table_name"{}
variable "billing_mode"{}
variable "hash_key"{}
variable "read_capacity"{}
variable "write_capacity"{}

/**********Lambda********************/
variable "description"{}
variable "filename"{}
variable "function_name"{}
variable "handler"{}
variable "role_arn"{}
variable "runtime"{}

/**********Lambda Permissions*************************/
variable "statement_id"{}
variable "action"{}
variable "principal"{}

/**************SNS*******************/
variable "topic_name"{}
variable "protocol"{}