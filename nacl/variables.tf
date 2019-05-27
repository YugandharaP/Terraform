variable "access_key"{}
variable "secret_key"{}
variable "region"{}

variable "division" {}
variable "project" {}
variable "application" {}
variable "environment" {}
variable "node" {}
variable "created_by" {}

variable "terraform_remote_state_bucket"{}
variable "terraform_remote_state_vpc_key"{}
variable "terraform_remote_state_region"{}

variable "nacl_name"{
	description = "nacl_name"
	type        = "string"
}

variable "ingress_count" {
  description = "set count number to how many ingress rules want to create."
  default     = true
}

variable "ingress_protocol"{
	description = "List of ingress rule to create protocol (e.g. 'tcp' or 'http')"
	type = "list"
	default     = []
}

variable "ingress_rule_no"{
	description = "Set ingress rule priority (e.g. '100' or '200')"
	default     = []
}

variable "ingress_action"{
	description = "set action on ingress_rule (e.g. 'allow' or 'deny')"
	default     = []
}
variable "ingress_cidr_block" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  default     = []
}
variable "ingress_from_port"{
	description = "List of source port numbers (e.g. '0.0.0.0.0/0')"
	default     = []
}

variable "ingress_to_port"{
	description = "List of destination port numbers (e.g. '0.0.0.0/0')"
	default     = []
}
variable "egress_count" {
  description = "set count number to how many egress rules want to create."
  default     = true
}

variable "egress_protocol"{
	description = "List of ingress rule to create protocol (e.g. 'tcp' or 'http')"
	type = "list"
	default     = []
}

variable "egress_rule_no"{
	description = "Set ingress rule priority (e.g. '100' or '200')"
	default     = []
}

variable "egress_action"{
	description = "set action on ingress_rule (e.g. 'allow' or 'deny')"
	default     = []
}
variable "egress_cidr_block" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  default     = []
}
variable "egress_from_port"{
	description = "List of source port numbers (e.g. '0.0.0.0.0/0')"
	default     = []
}

variable "egress_to_port"{
	description = "List of destination port numbers (e.g. '0.0.0.0.0/0')"
	default     = []
}

