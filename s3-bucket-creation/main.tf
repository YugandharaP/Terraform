provider "aws" {
	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region     	= "${var.region}"
	version 	= "~> 2.1"
}

/***************s3-bucket-creation*************************/
resource "aws_s3_bucket" "s3-bucket"{
	bucket		= "${var.bucket_name}"
	acl			= "${var.acl_policy}"
}

/************Uploading file into S3 bucket******************/
resource "aws_s3_bucket_object" "upload-file" {
	depends_on 		= ["aws_s3_bucket.s3-bucket"]
	bucket 			= "${var.bucket_name}"
	key    			= "${var.key}"
	source			= "${var.files}"
	content_type 	= "${var.content_type}"
}
