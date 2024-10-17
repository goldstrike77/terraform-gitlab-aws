module "aws_vpc" {
  source        = "git::http://gitea.home.local/suzhetao/terraform-module-aws.git//vpc?ref=v0.1"
  tags          = var.tags
  aws_resources = var.aws_resources
}

module "aws_subnet" {
  source        = "git::http://gitea.home.local/suzhetao/terraform-module-aws.git//subnet?ref=v0.1"
  tags          = var.tags
  aws_resources = var.aws_resources
  depends_on    = [module.aws_vpc]
}
