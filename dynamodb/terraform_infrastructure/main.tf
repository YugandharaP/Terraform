module "s3" {
  source      = "./modules/s3"
  stack_name  = "${var.stack_name}"
  aws_region  = "${var.region}"
  environment = "${var.environment}"
  deploy_account = "${var.deploy_account}"
  target_account = "${var.target_account}"
  s3_data_activity = "${var.s3_data_activity}"
  migration_type = "${var.migration_type}"
  // Variables for Tables
  dynamodb_table_typeA = "${var.dynamodb_table_typeA}"
  dynamodb_table_typeB = "${var.dynamodb_table_typeB}"
}

module "dynamodb" {
  source      = "./modules/dynamodb"
  stack_name  = "${var.stack_name}"
  aws_region  = "${var.region}"
  environment = "${var.environment}"
  deploy_account = "${var.deploy_account}"
  tags = "${var.tags}"

  ////////dynamodb_table_typeA///////
  dynamodb_table_typeA = "${var.dynamodb_table_typeA}"
  hash_key_typeA = "${var.hash_key_typeA}"
  attribute_hash_key_typeA = "${var.attribute_hash_key_typeA}"

  ////////dynamodb_table_typeB///////
  dynamodb_table_typeB = "${var.dynamodb_table_typeB}"
  hash_key_typeB = "${var.hash_key_typeB}"
  attribute_hash_key_typeB = "${var.attribute_hash_key_typeB}"
  range_key_typeB = "${var.range_key_typeB}"
  attribute_range_key_typeB = "${var.attribute_range_key_typeB}"
}

module "iam" {
  source      = "./modules/iam"
  stack_name  = "${var.stack_name}"
  deploy_account = "${var.deploy_account}"
}

module "lambda" {
  source      = "./modules/lambda"
  //bucket_id   = "${var.bucket_id}"
  source_bucket   = "${var.source_bucket}"
  lambda_basic_execution_role = "${var.lambda_basic_execution_role}"
  runtime = "${var.runtime}"
  function_name = "${var.function_name}"
  filename = "${var.filename}"
  handler = "${var.handler}"
  timeout         = "${var.timeout}"
  events              = "${var.events}"
  filter_prefix       = "${var.filter_prefix}"
  filter_suffix       = "${var.filter_suffix}"
}
