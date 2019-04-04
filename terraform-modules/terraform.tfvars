/****************S3**************************************/
bucket_name	= "student-application-bucket"
acl 		= "public-read"

/***************Lambda*********************************/
function_name 		= "sampleApp"
s3_key 				= "student-application.zip"
handler				= "com.cg.lambda.requesthandler.StudentAppHandler::handleRequest"
runtime 			= "java8"
aws_iam_role_arn 	= "arn:aws:iam::account-id:role/java-based-lambda-function"