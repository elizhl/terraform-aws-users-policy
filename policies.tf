resource "random_string" "role_random" {
  length = 16
  special = false
}


resource "aws_iam_policy" "demo-policy" {
  count = var.role_count

  name        = "demo-policy-${random_string.role_random.result}-${count.index}"
  path        = "/"
  description = "My demo  policy"
  policy			= data.aws_iam_policy_document.policy_document.json


}

resource "aws_iam_role" "demo-role" {
  count = var.role_count

	name        = "demo-role-${random_string.role_random.result}-${count.index}"
  assume_role_policy = data.aws_iam_policy_document.role_policy.json

  tags = {
    "Organization" = var.organization
  }
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  count = var.role_count

	role			 = aws_iam_role.demo-role[count.index].name
	policy_arn = aws_iam_policy.demo-policy[count.index].arn
}
