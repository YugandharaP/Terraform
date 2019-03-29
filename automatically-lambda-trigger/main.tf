provider "aws" {
	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region     	= "${var.region}"
	version 	= "~> 2.1"
}

/**********S3 bucket creation******************/
resource "aws_s3_bucket" "s3bucket"{
	bucket		=	"${var.bucket_name}"
	acl			=	"${var.acl_policy}"
	policy		=	"${file("policy.json")}"
	versioning {
		enabled = "${var.versioning}"
	}
}

/************** CREATING A ROLE FOR LAMBDA *************************/
resource "aws_iam_role" "iam_for_lambda" {
  name 					= "${var.iam_role_name}"
  assume_role_policy 	= "${file("assume_role_policy.json")}"
}

/******************** ATTACHING A MULTIPLE POLICIES IAM ROLE FOR LAMBDA ****************************/
resource "aws_iam_role_policy_attachment" "role-policy-attachment" {
  role       = "${aws_iam_role.iam_for_lambda.name}"
  count      = "${var.count}"
  policy_arn = "${element(var.iam_policy_arn,count.index)}"
}

/******************** CRETING A LAMBDA FUNCTION ****************************/
resource "aws_lambda_function" "s3trigger_lambda" {
	function_name   = "${var.function_name}"
	filename		= "${var.filename}"
	handler 		= "${var.handler}"
	runtime 		= "${var.runtime}"
	role            = "${aws_iam_role.iam_for_lambda.arn}"
}

/************ aws_lambda_permission *************************************/
resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "${var.statement_id}"
  action        = "${var.action}"
  function_name = "${aws_lambda_function.s3trigger_lambda.arn}"
  principal     = "${var.principal}"
  source_arn    = "${aws_s3_bucket.s3bucket.arn}"
}

/************ CREATING TRIGGER POINT ON S3 BUCKET **********************/
resource "aws_s3_bucket_notification" "bucket_notification" {
	bucket 						= "${aws_s3_bucket.s3bucket.id}"
	lambda_function {
		lambda_function_arn 	= "${aws_lambda_function.s3trigger_lambda.arn}"
		events              	= "${var.events}"
		filter_prefix       	= "${var.filter_prefix}"
		filter_suffix       	= "${var.filter_suffix}"
	}
}

/**************upload file in S3 bucket***********/
resource "aws_s3_bucket_object" "s3files" {
	depends_on		= ["aws_s3_bucket.s3bucket"]
	bucket 			= "${var.bucket_name}"
	key    			= "${var.key}"
	source 			= "${var.files}"
	content_type 	= "${var.content_type}"
}






