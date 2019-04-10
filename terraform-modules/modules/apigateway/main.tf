
/**********Creating Api Gateway*******************/
resource "aws_api_gateway_rest_api" "apigateway_lambda_dynamodb" {
  name          = "${var.apigateway_name}"     
  description   = "${var.description}"
  
}

//create resource
resource "aws_api_gateway_resource" "apigateway_resource" {
  rest_api_id = "${aws_api_gateway_rest_api.apigateway_lambda_dynamodb.id}"
  parent_id   = "${aws_api_gateway_rest_api.apigateway_lambda_dynamodb.root_resource_id}"
  path_part   = "${var.path_part}"
}

//create path variable path
resource "aws_api_gateway_resource" "apigateway_resource_id" {
  rest_api_id = "${aws_api_gateway_rest_api.apigateway_lambda_dynamodb.id}"
  parent_id   = "${aws_api_gateway_resource.apigateway_resource.id}"
  path_part   = "{id}"
}

//create method
  resource "aws_api_gateway_method" "apigateway_method" {
  rest_api_id 	= "${aws_api_gateway_rest_api.apigateway_lambda_dynamodb.id}"
  resource_id   = "${aws_api_gateway_resource.apigateway_resource_id.id}"
  http_method   = "${var.http_method}"
  authorization = "${var.authorization}"
}

//integrate with lambda
resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = "${aws_api_gateway_rest_api.apigateway_lambda_dynamodb.id}"
  resource_id = "${aws_api_gateway_method.apigateway_method.resource_id}"
  http_method = "${aws_api_gateway_method.apigateway_method.http_method}"

  integration_http_method = "${var.integration_http_method}"
  type                    = "${var.apigateway_type}"
  uri                     = "${var.lambda_arn}"
  request_templates = {                 
		"application/json" = "${file(var.mapping_template)}"
  }
}
  
//create a permission for our API Gateway deployment to invoke the Lambda function
resource "aws_lambda_permission" "apigateway" {
  statement_id  = "${var.statement_id}"
  action        = "${var.lambda_action}"
  function_name = "${var.lambda_function_name}"
  principal     = "${var.apigateway_principal}"
  source_arn = "${aws_api_gateway_deployment.lambda.execution_arn}/*/*"
}
  
//define reponse to method and resource
resource "aws_api_gateway_method_response" "200" {
  rest_api_id = "${aws_api_gateway_rest_api.apigateway_lambda_dynamodb.id}"
  resource_id = "${aws_api_gateway_method.apigateway_method.resource_id}"
  http_method = "${aws_api_gateway_method.apigateway_method.http_method}"
  status_code = "${var.status_code}"
  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration_response" "IntegrationResponse" {
  rest_api_id = "${aws_api_gateway_rest_api.apigateway_lambda_dynamodb.id}"
  resource_id = "${aws_api_gateway_method.apigateway_method.resource_id}"
  http_method = "${aws_api_gateway_method.apigateway_method.http_method}"
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
