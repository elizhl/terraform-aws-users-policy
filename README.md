# terraform-aws-users-policy

Example of usage
```hcl
module "terraform-aws-users-policy" {
  source       = "git@github.com:JavierClairvaux/terraform-aws-users-policy.git"
  aws_region   = "us-east-1"
  profile      = "test"
  user_count   = 3
  user_policy  = "${PATH_TO_YOUR_IAM_POLICY}"
  organization = "dev"
  role_count   = 4
  role_policy  = "${PATH_TO_YOUR_ROLE_POLICY}"
}

```
