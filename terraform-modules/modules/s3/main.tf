resource "aws_s3_bucket" "s3_bucket_creation"{
	bucket	=	"${var.bucket_name}"
	acl		=	"${var.acl}"
	policy	=	"${file(var.policy)}"
	website {
		index_document = "${var.index_document}"
	}
	versioning {
		enabled = "${var.versioning}"
	}
}
