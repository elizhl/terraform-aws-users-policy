provider "aws" {
  region  = var.aws_region
	profile = var.profile
}

resource "aws_iam_user" "user_list"{
	count = var.user_count

  name = "demo-${count.index}"
  path = "/"

  tags = {
    "Organization" = var.organization 
  }

}


resource "aws_iam_user_policy" "user_policy_list" {
	count = var.user_count

  name = "demo-${count.index}"
	user = aws_iam_user.user_list[count.index].name
	policy =file(var.user_policy)

}
