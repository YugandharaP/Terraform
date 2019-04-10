# Terraform
Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.
####  Website: https://www.terraform.io
Terraform can manage includes low-level components such as compute instances, storage, and networking, as well as high-level components such as DNS entries, SaaS features, etc.
### The key features of Terraform are:
- #### Infrastructure as Code :
The idea behind infrastructure as code (IAC) is that you write and execute code to define, deploy, and update your infrastructure. This represents an important shift in mindset where you treat all aspects of operations as software-even those aspects that represent hardware (e.g., setting up physical servers). In fact, a key insight of DevOps is that you can manage almost everything in code, including servers, databases, networks, log files, application configuration, documentation, automated tests, deployment processes, and so on. Infrastructure can be shared and re-used.
- #### Execution Plans
Terraform has a "planning" step where it generates an execution plan. The execution plan shows what Terraform will do when you call apply. This lets you avoid any surprises when Terraform manipulates infrastructure.
- #### Change Automation
Complex change sets can be applied to your infrastructure with minimal human interaction. With the previously mentioned execution plan and resource graph, you know exactly what Terraform will change and in what order, avoiding many possible human errors.
- #### Providers
Terraform is used to create, manage, and update infrastructure resources such as physical machines, VMs, network switches, containers, and more. Almost any infrastructure type can be represented as a resource in Terraform. Terraform abstracts out the interaction with various infrastructure services (AWS, Digital Ocean, OpenStack, Docker, Helm, TLS, etc.) and provides a unified configuration format for it.
- #### Configuration Language
Terraform uses its own configuration language, designed to allow concise descriptions of infrastructure. The Terraform language is declarative, describing an intended goal rather than the steps to reach that goal.

## Getting Started & Documentation
### Requirements
* [Terraform](https://www.terraform.io/downloads.html) 0.10+
### Installation
To install Terraform, find the appropriate package for your system and download it from  https://www.terraform.io/downloads.html
unzip it, provide PATH in environment variable and run binary file.
> #### Note : terraform.exe file and config files (.tf, .tfvars) are should be in same folder.

### Usage
To run terraform files or terraform examples you need to execute:
```sh
$ terraform init
$ terraform plan
$ terraform apply

```
Note that some example may create resources which can cost money. Run ``` $ terraform destroy ``` when you don't need these resources.

### Important

- **`.tf`** files are all combined to provide the full configuration. This gives us a handy way to break the configuration up into thematic sections.
-	**`.tfstate`** and **`.tfstate.backup`** holds the last-known state of the infrastructure, you’ll want to store this, too.
-	**`.tfvars`** contain values for the declared variables, typically called: **terraform.tfvars**.
-	To see what Terraform will do: `terraform plan -var-file terraform.tfvars`
-	To bring up the infrastructure we’ll run: `terraform apply -var-file terraform.tfvars`
-	And to destroy it, we’ll run: `terraform destroy -var-file terraform.tfvars`


### Related Projects
Check out these related projects.
* [Getting Started Examples](https://github.com/YugandharaP/Terraform/tree/terraform-getting-started) : Creating terraform file,variable file,modules,install data on EC2, creating Security groups.
* [EC2](https://github.com/YugandharaP/Terraform/tree/ec2) : Creating EC2 instance and connect it from local.
* [IAM Role](https://github.com/YugandharaP/Terraform/tree/iam) : Create IAM roles
* [SNS](https://github.com/YugandharaP/Terraform/tree/sns) : Create SNS and pulish messages, also create subscriber for subscription.
* [S3-Bucket-Creation-and-static-website-hosting](https://github.com/YugandharaP/Terraform/tree/s3) : Creating S3 bucket for static web site hosting
* [Lambda](https://github.com/YugandharaP/Terraform/tree/lambda) : Creating single Lambda function,multiple lambda functions and automatically trigger lambda function.
* [Dynamo DB](https://github.com/YugandharaP/Terraform/tree/dynamodb) : Creating Dynamo DB table and insterted items in it.
* [API Gateway](https://github.com/YugandharaP/Terraform/tree/apigateway) : Create API Gateway for REST api's to GET,POST,DELETE data from Dynamo DB.
* [Route 53](https://github.com/YugandharaP/Terraform/tree/route53) : Creating Route 53 hosted zone.
* [Website Hosting Using Domain](https://github.com/YugandharaP/Terraform/tree/websiteHosting) : Create Freenom domain and hosting static website(which is in S3),use Cloud front for caching and routed request through Route 53.


## Refferences
- https://www.terraform.io
- https://www.terraform-best-practices.com/
