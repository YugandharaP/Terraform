provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

/********Creating Dynamo DB Table*************************/
resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.table_name}"
  billing_mode   = "${var.billing_mode}"
  read_capacity  = "${var.read_capacity}"
  write_capacity = "${var.write_capacity}"
  hash_key       = "${var.hash_key}"

  //hash_key column required to create into table
   attribute {
		name 	= "${var.hash_key}"
		type 	= "${var.attribute_type}"
  }
  ttl {
    attribute_name = "${var.ttl_attribute_name}"
    enabled        = false
  }
}

/******Inserting items into table*****************/
resource "aws_dynamodb_table_item" "basic-dynamodb-table-items" {
  table_name 	= "${aws_dynamodb_table.basic-dynamodb-table.name}"
  hash_key   	= "${aws_dynamodb_table.basic-dynamodb-table.hash_key}"
  item 			= "${file("items.json")}"
}