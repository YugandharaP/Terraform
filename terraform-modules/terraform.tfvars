/**************Security Group *************************/
security_group_name	= "my_security_group"
ingress_from_port 	= "22"
ingress_to_port 	= "22"
ingress_protocol 	= "tcp"
ingress_cidr_blocks = ["0.0.0.0/0"]
egress_from_port 	= "0"
egress_to_port 		= "0"
egress_protocol 	= "-1"
egress_cidr_blocks 	= ["0.0.0.0/0"]

/*******************IAM*******************************/
role_name 			= "my-new-lambda-role"
description 		= "Allows Lambda functions to call AWS services on your behalf."
assume_role_policy 	= "local_path/iam_role_policy.json"
iam_policy_count    = 1
iam_policy_arn 		= ["local_path/iam_role_policy.json"]

/***************EC2***********************************/
file 			= "install_apache.sh"
algorithm		= "RSA"
key_name 		= "key_name"
ami 			= "ami-0c55b159cbfafe1f0"
instance_type 	= "t2.micro"
tag_name 		= "my_instance"
connection_type = "ssh"
user 			= "ubuntu"
key_path 		= "D:/Credentials/demo-instance.pem"
file 			= "install_apache.sh"

/****************S3************************************/
bucket_name		= "student-application-bucket"
acl 			= "public-read"
policy 			= "bucketpolicy.json"
index_document 	= "index.html"
versioning 		= "true"
object_key 		= "index.html"
upload_file_in_bucket = "./html"
content_type 	= "text/html"
s3_origin_id 	= ""

/***************Lambda*********************************/
lambda_count 		= 1
function_name 		= [""]
s3_key 				= ["student-application.zip"]
handler				= ["com.cg.lambda.requesthandler.StudentAppHandler::handleRequest"]
runtime 			= "java8"
lambda_assume_role_policy = [""]
filename 			= "index.zip"
events 				= ["s3:ObjectCreated:*"] 
statement_id 		= "AllowExecutionFromS3Bucket"
action 				= "lambda:InvokeFunction"
principal 			= "s3.amazonaws.com"
filter_prefix 		= ""
filter_suffix 		= ""
bucket_arn 			= "arn:aws:s3:::bucketname"

/***********DynamoDBConfigurations*********************/
table_name 		= "GameScores"
hash_key		= "exampleHashKey"
billing_mode 	= "PROVISIONED"
read_capacity	= 20
write_capacity 	= 20
type 			= "S"
ietmsfile		= "items.json"

/***********SNS*********************/
protocol         = "lambda"
endpoint         = "lambda.arn"
name             = "Sns-demo-topic"
display_name     = "Demo_Topic"
topic_arn        = "${module.sns.arn}"

/*****************Api Gateway***********************/
apigateway_name 	= ""
description 		= ""
path_part 			= ""
http_method   		= "GET"
authorization 		= "NONE"
integration_http_method ="POST"
apigateway_type 	= "AWS_PROXY"
lambda_arn 			= ""
mapping_template 	= "mapping-template.vtl"
statement_id 		= "AllowAPIGatewayInvoke"
lambda_action 		= "lambda:InvokeFunction"
lambda_function_name 	= "samplefunction"
apigateway_principal 	= "apigateway.amazonaws.com"
status_code 		= ""
stage_name 			= "test"

/**********ACM Certification****************/
validation_method 			= "DNS"

/************Route 53************************************/
domain_name					= "google.com"
route_type					= "A"

/******************CloudFront*****************************/
viewer_protocol_policy		= "redirect-to-https"
allowed_methods				= ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
cached_methods				= ["GET", "HEAD"]
enabled 					= ""
is_ipv6_enabled				= "true"
aliases						= ["google.com"]
query_string				= "false"
headers						= ["Origin"]
min_ttl						= 0
default_ttl					= 86400
max_ttl 					= 31536000
compress 					= false
price_class        			= "PriceClass_All"
restriction_type 			= "none"
locations					= ["US", "CA", "GB", "DE"]
ssl_support_method			= ""
acm_certificate_arn 		= ""