provider "aws" {
  region = var.aws_region
}

module "s3_static_site" {
  source = "./modules/s3"
  bucket_name = var.bucket_name
}

module "acm_cert" {
  source = "./modules/acm"
  domain_name = var.domain_name
}

module "cloudfront" {
  source = "./modules/cloudfront"
  bucket_name = var.bucket_name
  acm_arn     = module.acm_cert.acm_arn
}