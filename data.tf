data "aws_iam_policy_document" "iam_policy" {
  statement {
    effect		= var.iam_effect
    actions		= var.iam_actions
		resources = var.iam_resources 
  }
}

data "aws_iam_policy_document" "role_policy" {

  statement {
    effect  = var.role_effect
    actions = var.role_actions

    principals {
      type        = var.role_type
      identifiers = var.role_identifiers
    }
  }
}

data "aws_iam_policy_document" "policy_document" {

  statement {
    effect    = var.policy_effect
    actions   = var.policy_actions
    resources = var.policy_resources 
  }

}
