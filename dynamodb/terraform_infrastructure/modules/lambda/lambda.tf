#archiving s3_sync.py file
data "archive_file" "lambda_archive" {
  type        = "zip"
  source_file = "${path.module}/data/s3_sync.py"
  output_path = "${path.module}/data/s3_sync.zip"
}

#s3 bucket
data "aws_s3_bucket" "source_bucket" {
  bucket = "${var.source_bucket}"
}


resource "aws_lambda_function" "s3trigger-sync-lambda" {
	function_name   = "${var.stack_name}-${var.function_name}"
	filename		    = "${path.module}/${var.filename}"
	handler 		    = "${var.handler}"
	runtime 		    = "${var.runtime}"
	role            = "${aws_iam_role.iam_for_lambda.arn}"
  timeout         = "${var.timeout}"
  depends_on      = ["aws_iam_role_policy_attachment.lambda_logs", "aws_cloudwatch_log_group.s3_sync_lambda_logs"]
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.s3trigger-sync-lambda.arn}"
  principal     = "s3.amazonaws.com"
  source_arn    = "${data.aws_s3_bucket.source_bucket.arn}"
}

/***
resource "aws_s3_bucket" "source_bucket" {
  bucket = "${var.source_bucket}"
}
***/

#---Lambda event trigger
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "${data.aws_s3_bucket.source_bucket.id}"

  lambda_function {
    lambda_function_arn = "${aws_lambda_function.s3trigger-sync-lambda.arn}"
    events              = "${var.events}"
    filter_prefix       = "${var.filter_prefix}"
    filter_suffix       = "${var.filter_suffix}"
  }
}

# This is to optionally manage the CloudWatch Log Group for the Lambda Function.
# If skipping this resource configuration, also add "logs:CreateLogGroup" to the IAM policy below.
resource "aws_cloudwatch_log_group" "s3_sync_lambda_logs" {
  name              = "/aws/lambda/${var.stack_name}-${var.function_name}"
  retention_in_days = 14
}