provider "aws" {
	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region     	= "${var.region}"
	version 	= "~> 2.1"
}

/****************Creating SNS topic*************/
resource "aws_sns_topic" "sns_messages" {
  name = "${var.topic_name}"
}
resource "aws_sns_topic_subscription" "lambda" {
  topic_arn = "${aws_sns_topic.sns_messages.arn}"
  protocol  = "${var.protocol}"
  endpoint  = "${var.lambda_endpoint}"
}











