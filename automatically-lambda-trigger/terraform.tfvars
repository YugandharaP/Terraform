access_key 					= "Provide your access_key here"
secret_key 					= "Provide your secret_key here"

/**************S3********************************/
bucket_name					=	"bucket_name"
acl_policy					= 	"public-read"
versioning					= 	"true"
key							=	"bucket file key e.g index.html"
files 						=	"local file path"
content_type				=	"text/html"


/***********IAM*****************************/
iam_role_name 	= "s3-event-trigger-role"
count 			= 1
iam_policy_arn 	= ["iam_policy_arn"]

/*******************Lambda*******************/
function_name 	= "function_name"
filename        = "filename"
handler			= "handler"
runtime			= "nodejs8.10"
events			= ["events"]


statement_id 	= "AllowExecutionFromS3Bucket"
action 			= "lambda:InvokeFunction"
principal 		= "s3.amazonaws.com"
filter_prefix 	= ""
filter_suffix 	= ""
