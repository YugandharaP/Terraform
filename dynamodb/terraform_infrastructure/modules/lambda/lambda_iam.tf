data "aws_region" "current" {}

# Create role for Lambda
resource "aws_iam_role" "iam_for_lambda" {
  name = "${var.lambda_basic_execution_role}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
	    "Sid": "",
      "Effect": "Allow",
      "Action": [
		    "sts:AssumeRole"
	    ],
	    "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }
  ]
}
EOF
}


resource "aws_iam_policy" "lambda_logging" {
  name = "${var.stack_name}-${var.function_name}-logging"
  path = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    },
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "*"
     }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role = "${aws_iam_role.iam_for_lambda.name}"
  policy_arn = "${aws_iam_policy.lambda_logging.arn}"
}