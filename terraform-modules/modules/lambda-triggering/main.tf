/******************** CRETING A LAMBDA FUNCTION ****************************/
resource "aws_lambda_function" "s3trigger_lambda" {
	count 			= "${var.lambda_count}"
	function_name   = "${element(var.function_name,count.index)}"
	filename		= "${var.filename}"
	handler 		= "${element(var.handler,count.index)}"
	runtime 		= "${var.runtime}"
	role            = "${var.assume_role_policy}"
}

/************ aws_lambda_permission *************************************/
resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "${var.statement_id}"
  action        = "${var.action}"
  function_name = "${aws_lambda_function.s3trigger_lambda.arn}"
  principal     = "${var.principal}"
  source_arn    = "${var.bucket_arn}"
}

/************ CREATING TRIGGER POINT ON S3 BUCKET **********************/
resource "aws_s3_bucket_notification" "bucket_notification" {
		bucket 						= "${var.bucket_id}"
		lambda_function {
			lambda_function_arn 	= "${aws_lambda_function.s3trigger_lambda.arn}"
			events              	= "${var.events}"
			filter_prefix       	= "${var.filter_prefix}"
			filter_suffix       	= "${var.filter_suffix}"
	}
}







