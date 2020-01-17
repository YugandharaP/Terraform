variable "function_name" {
  type = "string"
}

variable "stack_name" {
  default = "gtd"
}

variable "filename" {
 type = "string"
}

variable "handler" {
 type = "string"
}
variable "runtime" {
 type = "string"
}


variable "timeout"{
  type = "string"
}

 variable "source_bucket"{
   type="string"
 }

 variable "events"{
   default = []
 }
 variable "filter_prefix"{
   type = "string"
 }
 variable "filter_suffix"{
   type = "string"
 }


 variable "lambda_basic_execution_role"{}
