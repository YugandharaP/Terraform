variable "bucket_regional_domain_name" {}
variable "s3_origin_id"{}
variable "enabled" {}
variable "is_ipv6_enabled" {}
variable "aliases"{
	type = "list"
}
variable "viewer_protocol_policy" {}
variable "allowed_methods"{
	type = "list"
}
variable "cached_methods"{
	type = "list"
}
variable "query_string" {}
variable "headers"{
	type = "list"
}
variable "min_ttl" {}
variable "default_ttl" {}
variable "max_ttl" {}
variable "compress" {}
variable  "price_class" {}
variable "restriction_type" {}