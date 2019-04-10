resource "aws_s3_bucket_object" "upload_files" {
	bucket 			= "${var.bucket_id}"
	key    			= "${var.object_key}"
	source 			= "${var.upload_file_in_bucket}"
	content_type 	= "${var.content_type}"
}

locals {
	s3_origin_id 		= "${var.s3_origin_id}"
}

output "bucket_regional_domain_name"{
	value = "aws_s3_bucket_object.upload_files.bucket_regional_domain_name"

}

output "s3_origin_id"{
	value = "local.s3_origin_id"
}