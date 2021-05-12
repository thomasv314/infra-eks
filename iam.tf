data "aws_current_caller" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

module "eks-iam" {
  source = "git@github.com:thomasv314/tf-eks-iam-roles.git?ref=master"

  cluster = "dev-cluster"

  roles = [
    {
      namespace = "ops"
      name      = "external-dns"
      policies = [
        "arn:aws:iam::${locals.account_id}:policy/external-dns"
      ]
    }
  ]
}
