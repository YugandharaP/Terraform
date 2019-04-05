resource "aws_dynamodb_table" "dynamodb_table" {
  name           = "${var.table_name}"
  billing_mode   = "${var.billing_mode}"
  read_capacity  = "${var.read_capacity}"
  write_capacity = "${var.write_capacity}"
  hash_key       = "${var.hash_key}"

  //hash_key field required
   attribute {
    name = "${var.hash_key}"
    type = "${var.type}"
  }
}
resource "aws_dynamodb_table_item" "dynamodb_table" {
  table_name = "${aws_dynamodb_table.dynamodb_table.name}"
  hash_key   = "${aws_dynamodb_table.dynamodb_table.hash_key}"
  item 		 = "${file(var.ietmsfile)}"
}
