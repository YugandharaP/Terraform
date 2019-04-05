#provider here aws
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  version = "~> 2.1"
}

module "security_group"{
	source 				= "/modules/securitygroup/"
	security_group_name	= "${var.security_group_name}"
	
    ingress_from_port   = "${var.ingress_from_port}"
    ingress_to_port     = "${var.ingress_to_port}"
    ingress_protocol    = "${var.ingress_protocol}"
    ingress_cidr_blocks = "${var.ingress_cidr_blocks}"
	egress_from_port   	= "${var.egress_from_port}"
	egress_to_port     	= "${var.egress_to_port}"
	egress_protocol    	= "${var.egress_protocol}"
	egress_cidr_blocks 	= "${var.egress_cidr_blocks}"
}

module "ec2" {
	source = "modules/ec2/"
	ami 					= "${var.ami}" 
	instance_type 			= "${var.instance_type}" 
	algorithm 				= "${var.algorithm}"
	key_name 				= "${var.key_name}"
	tag_name 				= "${var.tag_name}"
	key_path 				= "${var.key_path}"
	file 					= "${var.file}"
	user 					= "${var.user}"
	connection_type 		= "${var.connection_type}"
}

module "s3"{
	source 		= "/modules/s3/"
	bucket_name	= "${var.bucket_name}"
	acl			= "${var.acl}"
}


module "lambda"{
	source				= "/modules/lambda/"
	bucket_name			= "${var.bucket_name}"
	function_name		= "${var.function_name}"
	handler 			= "${var.handler}"
	runtime 			= "${var.runtime}"
	s3_key				= "${var.s3_key}"
	aws_iam_role_arn 	= "${var.aws_iam_role_arn}"
	
}

module "dynamodb"{
	source				= "/modules/dynamodb/"
	table_name          = "${var.table_name}"
	hash_key      		= "${var.hash_key}"
	billing_mode   		= "${var.billing_mode}"
	read_capacity  		= "${var.read_capacity}"
	write_capacity 		= "${var.write_capacity}"
	type 				= "${var.type}"
	ietmsfile			= "${var.ietmsfile}"
}



