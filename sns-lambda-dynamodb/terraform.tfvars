access_key = "Provide your access_key here"
secret_key = "provide your secret_key here"

/**************DynamoDB********************************/
table_name		= "Message"
billing_mode 	= "PROVISIONED"
hash_key 		= "messageid"
read_capacity	= 20
write_capacity	= 20

/***************Lambda*********************************/
description		= "An Amazon SNS trigger that logs the message pushed to the SNS topic."
filename        = "index.zip"
function_name 	= "sns-messages-trigger-TF"
handler			= "index.handler"
runtime			= "nodejs8.10"
role_arn		= "arn:aws:iam::account-id:role/my-lambda-dynamo-basic-execution-role"

/**********Lambda Permissions*************************/
statement_id	= "AllowExecutionFromSNS"
action			= "lambda:InvokeFunction"
principal		= "sns.amazonaws.com"

/*************SNS***************************************/
topic_name		= "notifyMe"
protocol		= "lambda"