/******************ACM Certificate creation***********************************/
resource "aws_acm_certificate" "certificate" {
  domain_name       = "${var.domain_name}"
  validation_method = "${var.validation_method}"
}