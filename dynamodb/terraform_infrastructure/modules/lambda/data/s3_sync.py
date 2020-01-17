import subprocess
import limport subprocess
import logging
import boto3


def check(bucket, key):
    s3client = boto3.client("s3")
    s3 = boto3.resource('s3')

    copy_source = {
          'Bucket': bucket,
          'Key': key
        }
    old_key_path = key
    new_key_path = old_key_path.replace("export_data/", "import_data/")
    print("new_key_path", new_key_path)
    
    bucket = s3.Bucket('gtd-bucket-dynamodb-target')
    bucket.copy(copy_source,new_key_path)


def lambda_handler(event, context):
   ev = event["Records"]
   bucketName = ev[0]["s3"]["bucket"]["name"]
   keyName = ev[0]["s3"]["object"]["key"]
   check(bucketName,keyName)
