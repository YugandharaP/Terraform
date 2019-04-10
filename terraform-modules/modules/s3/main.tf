resource "aws_s3_bucket" "s3_bucket_creation"{
	bucket	=	"${var.bucket_name}"
	acl		=	"${var.acl}"
	versioning {
		enabled = true
	}
}
