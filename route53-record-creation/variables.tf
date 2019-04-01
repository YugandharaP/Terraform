variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

/**********Route53*************************/
variable "domain_name"{}
variable "type"{}
variable "cloudfront_domain_name"{}
variable "cloudfront_hosted_zone_id"{}