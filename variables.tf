variable "aws_region" {
	description = "Region where everything it's going to be provishioned"
	default			= "us-east-2"
}

variable "profile"{
	description = "AWS profile to use"
	default     = "test"
}

variable "user_count" {
	description = "number of users"
	default			= 2
}

variable "user_policy" {
	description = "Users' policy"
	#default			= "test.json" 
	default			= "~/all-terraform/terraform-aws-users-policy/test.json"
}

variable "organization"{
	description = "users' organization"
	default = "default"
}

variable "role_count" {
	description = "number of users"
	default			= 2
}

variable "role_policy" {
	description = "Users' policy"
	default			= "~/all-terraform/terraform-aws-users-policy/test_role.json" 
}
