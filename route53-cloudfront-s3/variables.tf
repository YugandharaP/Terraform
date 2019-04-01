variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

/***********S3****************/
variable "website_bucket_name"{}
variable "index_document_name"{}
variable "acl_policy"{}
variable "versioning"{}
variable "key"{}
variable "files"{}
variable "content_type"{}
variable "s3_origin_id"{}

/**********CloudFront********************/
variable "viewer_protocol_policy"{}
variable "allowed_methods"{
	type = "list"
}
variable "cached_methods"{
	type = "list"
}
variable "is_ipv6_enabled"{}
variable "aliases"{
	type = "list"
}
variable "query_string"{}
variable "headers"{
	type = "list"
}
variable "min_ttl"{}
variable "default_ttl"{}
variable "max_ttl"{}
variable "compress"{}

variable "price_class"{}
variable "restriction_type"{}

variable "locations"{
	type = "list"
}
variable "ssl_support_method"{}

/**********Route53*************************/
variable "domain_name"{}
variable "type"{}

/************ACM Certificate*****************/
variable "validation_method"{}