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
variable "bucket_name"	{}
variable "acl" {}

/***************Lambda*********************************/
variable "s3_key"{}
variable "function_name"{
	description = "Create the lambda function with different names"
}
variable "handler"{
	description = "Handlers for different lambdas"
}
variable "aws_iam_role_arn"{}
variable "runtime"{}

/***********DynamoDBConfigurations*********************/
variable "table_name"{}
variable "hash_key"{}
variable "billing_mode"{}
variable "read_capacity"{}
variable "write_capacity"{}
variable "type"{}
variable "ietmsfile"{}