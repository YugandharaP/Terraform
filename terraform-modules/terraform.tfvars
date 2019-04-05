
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
/***************EC2***********************************/
file 			= "install_apache.sh"
algorithm		= "RSA"
key_name 		= "key_name"
ami 			= "ami-0c55b159cbfafe1f0"
instance_type 	= "t2.micro"
tag_name 		= "my_instance"
connection_type = "ssh"
user 			= "ubuntu"
key_path 		= "local file path"
file 			= "install_apache.sh"
/****************S3************************************/
bucket_name	= "student-application-bucket"
acl 		= "public-read"
/***************Lambda*********************************/
function_name 		= "sampleApp"
s3_key 				= "student-application.zip"
handler				= "com.cg.lambda.requesthandler.StudentAppHandler::handleRequest"
runtime 			= "java8"
aws_iam_role_arn 	= "arn:aws:iam::account-id:role/java-based-lambda-function"

/***********DynamoDBConfigurations*********************/
table_name 		= "GameScores"
hash_key		= "exampleHashKey"
billing_mode 	= "PROVISIONED"
read_capacity	= 20
write_capacity 	= 20
type 			= "S"
ietmsfile		= "items.json"