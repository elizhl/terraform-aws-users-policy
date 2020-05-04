provider "aws" {
  region  = var.aws_region
	profile = var.profile
}

resource "random_string" "user_random" {
  length = 16
  special = false
}

resource "aws_iam_user" "user_list"{
	count = var.user_count

  name = "${random_string.user_random.result}-${count.index}"
  path = "/"

  tags = {
    "Organization" = var.organization 
  }

}


resource "aws_iam_user_policy" "user_policy_list" {
	count = var.user_count

  name = "demo-${count.index}"
	user = aws_iam_user.user_list[count.index].name
	policy = data.aws_iam_policy_document.iam_policy.json
}
