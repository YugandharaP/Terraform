resource "aws_s3_bucket" "gtd_bucket_dynamodb" {
bucket              = "gtd-bucket-dynamodb-${var.migration_type}"
tags                = "${var.tags}"
region              = "${var.region}"
}

#This export_data is used to export dynamodb tables from the current account and ready for migration
resource "aws_s3_bucket_object" "export_data" {
    depends_on = ["aws_s3_bucket.gtd_bucket_dynamodb"]
    bucket     = "gtd-bucket-dynamodb-${var.migration_type}"
    key    = "export_data/"
    source = "/dev/null"
}

# This import_data is used to import into dynamodb tables from the exported tables from different account
resource "aws_s3_bucket_object" "import_data" {
    depends_on = ["aws_s3_bucket.gtd_bucket_dynamodb"]
    bucket  = "gtd-bucket-dynamodb-${var.migration_type}"
    key    = "import_data/"
    source = "/dev/null"
}

#************************Create Dynamodb table backup s3 folders for indivisual Table Types************************************#

resource "aws_s3_bucket_object" "dynamodb_table_typeA" {
    depends_on = ["aws_s3_bucket.gtd_bucket_dynamodb"]
    bucket  = "gtd-bucket-dynamodb-${var.migration_type}"
    key    = "${var.s3_data_activity}/${var.stack_name}-${var.dynamodb_table_typeA[count.index]}/"
    count = "${length(var.dynamodb_table_typeA)}"
    source = "/dev/null"
    }

resource "aws_s3_bucket_object" "dynamodb_table_typeB" {
    depends_on = ["aws_s3_bucket.gtd_bucket_dynamodb"]
    bucket  = "gtd-bucket-dynamodb-${var.migration_type}"
    key    = "${var.s3_data_activity}/${var.stack_name}-${var.dynamodb_table_typeB[count.index]}/"
    count = "${length(var.dynamodb_table_typeB)}"
    source = "/dev/null"
    }
    
#----s3 bucket policy
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = "${aws_s3_bucket.gtd_bucket_dynamodb.arn}"
  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DelegateS3Access",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.target_account}:root"
            },
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::gtd-bucket-dynamodb-${var.migration_type}/*",
                "arn:aws:s3:::gtd-bucket-dynamodb-${var.migration_type}"
            ]
        }
     ]
  }
 POLICY
} 