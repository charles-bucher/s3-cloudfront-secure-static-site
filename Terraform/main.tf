terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# ACM Certificate Module
module "acm_cert" {
  source = "./modules/acm"

  # Example variables (replace with real ones)
  domain_name       = var.domain_name
  validation_method = var.validation_method
}

# CloudFront Module
module "cloudfront" {
  source = "./modules/cloudfront"

  # Example variables (replace with real ones)
  domain_name     = var.domain_name
  acm_certificate = module.acm_cert.certificate_arn
  s3_bucket_name  = module.s3_static_site.bucket_name
}

# S3 Static Site Module
module "s3_static_site" {
  source = "./modules/s3"

  # Example variables (replace with real ones)
  bucket_name = var.bucket_name
  index_file  = "index.html"
  error_file  = "error.html"
}
