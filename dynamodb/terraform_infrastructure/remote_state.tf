data "terraform_remote_state" "backend_config" {
  backend = "s3"
  config {
    bucket = "${var.s3_bucket}"
    key    = "${var.s3_folder_project}/${var.s3_folder_region}/${var.s3_folder_type}/${var.environment}/gtd-dynamodb.tfstate"
    region = "${var.s3_folder_region}"
  }
}
