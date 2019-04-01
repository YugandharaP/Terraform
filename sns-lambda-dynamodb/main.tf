/***********AWS rovider***********/
provider "aws" {
	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region     	= "${var.region}"
	version 	= "~> 2.1"
}

/*************Creating DynamoDB*****************/
resource "aws_dynamodb_table" "sns_dynamodb_table" {
  name           = "${var.table_name}"
  billing_mode   = "${var.billing_mode}"
  read_capacity  = "${var.read_capacity}"
  write_capacity = "${var.write_capacity}"
  hash_key       = "${var.hash_key}"

  //hash_key field required
   attribute {
    name = "${var.hash_key}"
    type = "S"
  }
}
/******Creating Lambda function**************/
resource "aws_lambda_function" "node_based_lambda_function" {
	description		= "${var.description}"
	filename		= "${var.filename}"
	function_name 	= "${var.function_name}"
	handler 		= "${var.handler}"
	runtime 		= "${var.runtime}"
	role 			= "${var.role_arn}"
}

/****************Creating SNS topic*************/
resource "aws_sns_topic" "sns_messages" {
  name = "${var.topic_name}"
}

/*************SNS SUBSCRIPTION*******************************************/
resource "aws_sns_topic_subscription" "lambda" {
  topic_arn = "${aws_sns_topic.sns_messages.arn}"
  protocol  = "${var.protocol}"
  endpoint  = "${aws_lambda_function.node_based_lambda_function.arn}"
}

/************ aws_lambda_permission *************************************/
resource "aws_lambda_permission" "allow_sns" {
  statement_id  = "${var.statement_id}"
  action        = "${var.action}"
  function_name = "${aws_lambda_function.node_based_lambda_function.function_name}"
  principal     = "${var.principal}"
  source_arn    = "${aws_sns_topic.sns_messages.arn}"
}










