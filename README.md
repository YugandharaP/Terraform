# Terraform
Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.
####  Website: https://www.terraform.io
Terraform can manage includes low-level components such as compute instances, storage, and networking, as well as high-level components such as DNS entries, SaaS features, etc.

## Modules 
A module is a container for multiple resources that are used together.
Every Terraform configuration has at least one module, known as its root module, which consists of the resources defined in the .tf     files in the main working directory.
A module can call other modules, which lets you include the child module's resources into the configuration in a concise way. Modules  can also be called multiple times, either within the same configuration or in separate configurations, allowing resource                configurations to be packaged and re-used.

You need to follow following file structure : 
```sh
$ tree complete-module/
.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── ...
├── modules/
│   ├── nestedA/
│   │   ├── variables.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   ├── nestedB/
│   ├── .../

```
To call a module means to include the contents of that module into the configuration with specific values for its input variables.       Modules are called from within other modules using module blocks:
```sh
module "servers" {
  source = "./nestedA"
  servers = 5
}
```

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

- **`.tf`** : `.tf` (our case is main.tf) files are all combined to provide the full configuration. This gives us a handy way to break the configuration up into thematic sections.
- **`variables.tf`** : To become truly shareable and version controlled, need to parameterize the configurations.
> #### Note : The file can be named anything, since Terraform loads all files ending in .tf in a directory.
- **`outputs.tf`**  : Output variables as a way to organize data to be easily queried and shown back to the Terraform user.
-	**`.tfvars`** contain values for the declared variables or we can say to persist variable values, create a file and assign variables within this file.typically called: **terraform.tfvars**.

-	**`.tfstate`** and **`.tfstate.backup`** holds the last-known state of the infrastructure, you’ll want to store this, too.
-	To see what Terraform will do: `terraform plan -var-file terraform.tfvars`
-	To bring up the infrastructure we’ll run: `terraform apply -var-file terraform.tfvars`
-	And to destroy it, we’ll run: `terraform destroy -var-file terraform.tfvars`


## Refferences
- https://www.terraform.io
- https://www.terraform-best-practices.com/
