variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags (e.g. map('BusinessUnit`,`XYZ`)"
}

variable "environment" {
  description = "DynamoDB tables env"
}

variable "deploy_account" {
  description = "DynamoDB tables aws account id"
}

variable "target_account" {
  description = "target aws account id"
}

variable "s3_data_activity" {
  default = ""
}

variable "migration_type" {
  default = ""
}

variable "stack_name" {
  default = "gtd"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "region" {
  default = "us-east-1"
}


variable "VET_CLUSTER" {
  default = ""
}

variable "vet_role_access" {
  default = ""
}

variable "project" {
  default = "gtd"
}

variable "dynamodb_table_typeA" {
  default = []
}

variable "dynamodb_table_typeB" {
  default = []
}
