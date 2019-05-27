provider "aws" {
	access_key 	= "${var.access_key}"
	secret_key 	= "${var.secret_key}"
	region     	= "${var.region}"
}

locals {
  tags = {
    Division    = "${var.division}"
    Project     = "${var.project}"
    Application = "${var.application}"
    Environment = "${var.environment}"
    Node        = "${var.node}"
    Created_by  = "${var.created_by}"
  }
}

data "terraform_remote_state" "vpc" {
  backend 	= "s3"
  workspace = "${terraform.workspace}"
  config {
    bucket 	= "${var.terraform_remote_state_bucket}"
    key 	= "${var.terraform_remote_state_vpc_key}"
    region 	= "${var.terraform_remote_state_region}"
  }
}

#----------creating nacl------------
resource "aws_network_acl" "main_nacl"{
	vpc_id = "${data.terraform_remote_state.vpc.id}"
	tags = "${merge(local.tags, map("Name", "${var.nacl_name}"))}"
}

#----------creating nacl ingress rules------------
resource "aws_network_acl_rule" "ingress_rules" {
	network_acl_id = "${aws_network_acl.main_nacl.id}"
	count 		= "${var.ingress_count}"
	egress 		= false
    protocol    = "${element(var.ingress_protocol,count.index)}"
    rule_number = "${element(var.ingress_rule_no,count.index)}"
    rule_action = "${element(var.ingress_action , count.index)}"
    cidr_block  = "${element(var.ingress_cidr_block,count.index)}"
    from_port   = "${element(var.ingress_from_port, count.index)}"
    to_port     = "${element(var.ingress_to_port , count.index)}"
}

#----------creating nacl egress rules------------
resource "aws_network_acl_rule" "egress_rules" {
	network_acl_id = "${aws_network_acl.main_nacl.id}"
	count 		= "${var.egress_count}"
	egress 		= true
    protocol    = "${element(var.egress_protocol,count.index)}"
    rule_number = "${element(var.egress_rule_no,count.index)}"
    rule_action = "${element(var.egress_action , count.index)}"
    cidr_block  = "${element(var.egress_cidr_block,count.index)}"
    from_port   = "${element(var.egress_from_port, count.index)}"
    to_port     = "${element(var.egress_to_port , count.index)}"
}
