resource "aws_iam_policy" "demo-policy" {
  count = var.role_count

  name        = "demo-${count.index}"
  path        = "/"
  description = "My demo  policy"
  policy			= file(var.role_policy)


}

resource "aws_iam_role" "demo-role" {
  count = var.role_count

  name = "demo-role-${count.index}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    "Organization" = var.organization
  }
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  count = var.role_count

	role			 = aws_iam_role.demo-role[count.index].name
	policy_arn = aws_iam_policy.demo-policy[count.index].arn
}
