terraform {
  backend "remote" {
    hostname		 = "tfe.labdonus.tk" 
    organization = "douinnov"

		workspaces {
			name = "terraform-aws-users-policy"
		}
  }
}
