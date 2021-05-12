data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

module "eks-iam" {
  #  source = "git@github.com:thomasv314/tf-eks-iam-roles.git?ref=main"
  source  = "/home/thomas/code/tf-eks-iam"
  cluster = "dev-cluster"

  roles = [
    {
      namespace = "ops"
      name      = "external-dns"
      policies = [
        "arn:aws:iam::${local.account_id}:policy/external-dns"
      ]
    }
  ]
}
