#provider here aws
provider "aws" {
  access_key 	= "${var.access_key}"
  secret_key 	= "${var.secret_key}"
  region     	= "${var.region}"
  version 		= "~> 2.1"
}

/**********S3 bucket creation******************/
resource "aws_s3_bucket" "static_site"{
	bucket	=	"${var.website_bucket_name}"
	acl		=	"${var.acl_policy}"
	policy	=	"${file("policy.json")}"
	website {
		index_document = "${var.index_document_name}"
	}
	versioning {
		enabled = "${var.versioning}"
	}
}

/**************upload file in S3 bucket***********/
resource "aws_s3_bucket_object" "html-files" {
	depends_on		= ["aws_s3_bucket.static_site"]
	bucket 			= "${var.website_bucket_name}"
	key    			= "${var.key}"
	source 			= "${var.files}"
	content_type 	= "${var.content_type}"
}