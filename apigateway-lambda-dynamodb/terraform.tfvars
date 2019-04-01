access_key = "provide your access_key here"
secret_key = "Provide your secret_key here"

/**************S3 bucket********************************/
acl 			= "public-read"
key 			= "studentAppLambdaFunction.zip"
files 			= "file local path"
bucket_name 	= "bucketname"
content_type	= "application/zip"

/****************IAM-Role****************************/
iam_role_name = "java-based-lambda-function"

/***************Lambda*********************************/
function_name = "studentapplication"
s3_key  		= "https://s3.amazonaws.com/bucketname/student-application.zip"
handler			= "com.cg.lambda.requesthandler.StudentAppHandler::handleRequest"
runtime 		= "java8"
lambda_arn 		= "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:account-id:function:studentAppLambdaFunction/invocations"
statement_id 	= "AllowAPIGatewayInvoke"
action 			= "lambda:InvokeFunction"
function_name 	= "studentAppLambdaFunction"

/**************ApiGateway******************************/
apigateway_name = "StudentApi-Through-Terraform"
path_part 		= "student"
http_method 	= "GET"
authorization 	= "NONE"
integration_http_method = "POST"
integration_type 		= "AWS_PROXY"
stage_name				= "test"
