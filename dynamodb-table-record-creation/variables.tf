variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

variable "table_name"{}
variable "billing_mode"{}
variable "read_capacity"{}
variable "write_capacity"{}
variable "hash_key"{}
variable "attribute_type"{}
variable "ttl_attribute_name"{}