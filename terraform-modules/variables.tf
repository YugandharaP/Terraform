variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

/**************Security Group *************************/
variable "security_group_name"{}
variable "ingress_from_port" {
	
}
variable "ingress_to_port"{
	
}
variable "ingress_protocol"{
	
}
variable "ingress_cidr_blocks"{
	type = "list"
}
variable "egress_from_port"{
	
}
variable "egress_to_port"{
	
}
variable "egress_protocol"{
	
}
variable "egress_cidr_blocks"{
	type = "list"
}

/****************IAM************************/
variable "role_name" {}
variable "description"{}
variable "assume_role_policy"{}
variable "iam_policy_count"{}
variable "iam_policy_arn"{type = "list"}

/**************EC2************************/
variable "algorithm"{}
variable "key_name"{}
variable "ami"{}
variable "instance_type"{}
variable "tag_name"{}
variable "file"{}
variable "connection_type"{}
variable "user"{}
variable "key_path"{}

/**********S3***************/
variable "bucket_name"{}
variable "acl" {}
variable "policy"{}
variable "index_document"{}
variable "versioning"{}
variable "object_key"{}
variable "upload_file_in_bucket"{}
variable "content_type"{}
variable "bucket_arn"{}
variable "s3_origin_id"{}

/***************Lambda*********************************/
variable "lambda_count"{}
variable "s3_key"{
	type = "list"
}
variable "function_name"{
	description = "Create the lambda function with different names"
	type = "list"
}
variable "handler"{
	description = "Handlers for different lambdas"
	type = "list"
}
variable "runtime"{}
variable "lambda_assume_role_policy"{
	type = "list"
}
variable "filename"{}
variable "events"{
	type = "list"
}
variable "statement_id"{}
variable "action"{}
variable "principal"{}
variable "filter_prefix"{}
variable "filter_suffix"{}

/***********DynamoDBConfigurations*********************/
variable "table_name"{}
variable "hash_key"{}
variable "billing_mode"{}
variable "read_capacity"{}
variable "write_capacity"{}
variable "type"{}
variable "ietmsfile"{}

/********************* SNS service************************************/
variable "name" {}
variable "display_name" {}
variable "protocol" {}
variable "endpoint" {}
variable "topic_arn" {}

/*****************Api Gateway*********************/
variable "apigateway_name" {}
variable "path_part" {}
variable "http_method" {}
variable "authorization" {}
variable "integration_http_method" {}
variable "apigateway_type" {}
variable "lambda_arn" {}
variable "mapping_template"{}
variable "lambda_action" {}
variable "lambda_function_name" {}
variable "apigateway_principal" {}
variable "status_code" {}
variable "stage_name" {}

/************ACM Certificate*****************/
variable "validation_method"{}

/**********Route53*************************/
variable "domain_name"{}
variable "route_type"{}

/***********************CloudFront************************************/
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
variable "locations"{
	type = "list"
}