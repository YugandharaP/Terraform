provider "aws" {
	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region     	= "${var.region}"
	version 	= "~> 2.1"
}

/*****module "s3-bucket-creation*************/
resource "aws_s3_bucket" "s3module"{
	bucket		= "${var.bucket_name}"
	acl			= "${var.acl}"
}

/**********Upload zip file in S3******************/
resource "aws_s3_bucket_object" "file" {
	depends_on 		= ["aws_s3_bucket.s3module"]
	bucket 			= "${var.bucket_name}"
	key    			= "${var.key}"
	source			= "${var.files}"
	content_type 	= "${var.content_type}"
}

/***********Define IAM Role********************/

resource "aws_iam_role" "lambda_basic_exec" {
	name 				= "${var.iam_role_name}"
	description 		= "Allows Lambda functions to call AWS services on your behalf."
	assume_role_policy 	= "${file("policy.json")}"
}

/******Define Lambda function**************/
resource "aws_lambda_function" "java-based-lambda-function" {
	function_name 	= "${var.function_name}"
	s3_bucket 		= "${aws_s3_bucket.s3module.bucket}"
	s3_key    		= "${aws_s3_bucket_object.file.key}"
	handler 		= "${var.handler}"
	runtime 		= "${var.runtime}"
	role 			= "${aws_iam_role.lambda_basic_exec.arn}"
}


/**********Creating Api Gateway*******************/
resource "aws_api_gateway_rest_api" "apigateway_lambda_dynamodb" {
  name        = "${var.apigateway_name}"
  description = "Creating an api gateway via Terraform"
}

//create resource
resource "aws_api_gateway_resource" "api_gateway_resource" {
  rest_api_id = "${aws_api_gateway_rest_api.apigateway_lambda_dynamodb.id}"
  parent_id   = "${aws_api_gateway_rest_api.apigateway_lambda_dynamodb.root_resource_id}"
  path_part   = "${var.path_part}"
}

//create path variable path
resource "aws_api_gateway_resource" "api_gateway_resource_id" {
  rest_api_id = "${aws_api_gateway_rest_api.apigateway_lambda_dynamodb.id}"
  parent_id   = "${aws_api_gateway_resource.api_gateway_resource.id}"
  path_part   = "{id}"
}

//create method
resource "aws_api_gateway_method" "api_gateway_method" {
  rest_api_id = "${aws_api_gateway_rest_api.apigateway_lambda_dynamodb.id}"
  resource_id   = "${aws_api_gateway_resource.api_gateway_resource_id.id}"
  http_method   = "${var.http_method}"
  authorization = "${var.authorization}"
}

//integrate with lambda
resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = "${aws_api_gateway_rest_api.apigateway_lambda_dynamodb.id}"
  resource_id = "${aws_api_gateway_method.api_gateway_method.resource_id}"
  http_method = "${aws_api_gateway_method.api_gateway_method.http_method}"

  integration_http_method = "${var.integration_http_method}"
  type                    = "${integration_type}"
  uri                     = "${var.lambda_arn}"
  request_templates = {                 
    "application/json" = "${file("mapping-template.vtl")}"
  }
}
  
//create a permission for our API Gateway deployment to invoke the Lambda function
resource "aws_lambda_permission" "apigateway" {
  statement_id  = "${var.statement_id}"
  action        = "${var.action}"
  function_name = "${var.function_name}"
  principal     = "apigateway.amazonaws.com"
  source_arn 	= "${aws_api_gateway_deployment.lambda.execution_arn}/*/*"
}
  
//define reponse to method and resource
resource "aws_api_gateway_method_response" "200" {
  rest_api_id = "${aws_api_gateway_rest_api.apigateway_lambda_dynamodb.id}"
  resource_id = "${aws_api_gateway_method.api_gateway_method.resource_id}"
  http_method = "${aws_api_gateway_method.api_gateway_method.http_method}"
  status_code = "200"
  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration_response" "IntegrationResponse" {
  rest_api_id = "${aws_api_gateway_rest_api.apigateway_lambda_dynamodb.id}"
  resource_id = "${aws_api_gateway_method.api_gateway_method.resource_id}"
  http_method = "${aws_api_gateway_method.api_gateway_method.http_method}"
  status_code = "${aws_api_gateway_method_response.200.status_code}"
}
    
//create stage and deploy api 
resource "aws_api_gateway_deployment" "lambda" {
  depends_on = [
    "aws_api_gateway_integration.lambda"
  ]
	rest_api_id = "${aws_api_gateway_rest_api.apigateway_lambda_dynamodb.id}"
	stage_name  = "${var.stage_name}"
}















