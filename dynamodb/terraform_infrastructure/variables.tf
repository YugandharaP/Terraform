variable "tags" {
  type        = "map"
}

variable "market" {
  default = "tools"
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

variable "s3_bucket" {
  default = ""
}

variable "s3_data_activity" {
  default = ""
}

variable "migration_type" {
  default = ""
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

variable "writecapacity" {
  default = "5"
}

variable "readcapacity" {
  default = "5"
}

variable "read_capacity" {
  default = "5"
}

variable "write_capacity" {
  default = "5"
}

variable "VET_CLUSTER" {
  default = ""
}

variable "vet_role_access" {
  default = ""
}
variable "s3_folder_type" {
  default = ""
}

variable "s3_folder_region" {
  default = ""
}

variable "s3_folder_project" {
  default = ""
}

variable "project" {
  default = "gtd"
}

variable "subnets" {
  type = "list"
  default = []
}
variable "vpc_id" {
  default = ""
}

variable "acs_aws_user" {
  default = ""
}

####Variabbles for Table TypeA####
variable "dynamodb_table_typeA" {
  default = []
}
variable "hash_key_typeA" {
  default = []
}
variable "attribute_hash_key_typeA" {
  default = []
}

####Variabbles for Table TypeB####
variable "dynamodb_table_typeB" {
  default = []
}
variable "hash_key_typeB" {
  default = []
}
variable "attribute_hash_key_typeB" {
  default = []
}
variable "range_key_typeB" {
  default = []
}
variable "attribute_range_key_typeB" {
  default = []
}


#######Variables for Lambda #######

variable "function_name" {
  type = "string"
}

variable "filename" {
 type = "string"
}

variable "handler" {
 type = "string"
}
variable "runtime" {
 type = "string"
}


variable "timeout"{
  type = "string"
}

 variable "source_bucket"{
   type="string"
 }

 variable "events"{
   default = []
 }
 variable "filter_prefix"{
   type = "string"
 }
 variable "filter_suffix"{
   type = "string"
 }



 variable "lambda_basic_execution_role"{}
