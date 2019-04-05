# S3 Bucket Creation and Static Website hosting
* S3 bucket create through Terraform. 
* S3 Bucket for static public files
`Note that "Bucket-Name" should be unique.`


### Requirements
* [Terraform](https://www.terraform.io/downloads.html) 0.10+
* Static Web Page(index.html)
### Installation
To install Terraform, find the appropriate package for your system and download it from  https://www.terraform.io/downloads.html
unzip it, provide PATH in environment variable and run binary file.
> #### Note : terraform.exe file and config files (.tf, .tfvars) are should be in same folder.

## Usage
To run terraform files or terraform examples you need to execute:
```
$ terraform init
$ terraform plan
$ terraform apply
```


### Inputs
| Name | Description | Type | Required |
| ------ | ------ | ------ | ------ |
| bucket | The name of the bucket. | string | yes |
| acl | ACL grants the resource owner full control over the resource. | string | yes |
| custom_bucket_policy | JSON formatted bucket policy to attach to the bucket. | string | no |
| tags | A mapping of tags to assign to the bucket. | map | no |
| source | HTML file path | string | yes |
| key | File name | string | yes |
| content type | File format type | string | yes |


### Outputs
| Name | Description | 
| ------ | ------ | 
| arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname.| 
| id | The name of the bucket. | 
| s3_bucket_website_endpoint | The website endpoint URL |


## Refferences
- https://www.terraform.io
- https://www.terraform-best-practices.com/
