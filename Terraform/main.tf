terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Optional: Configure remote backend for state management
  # backend "s3" {
  #   bucket         = "your-terraform-state-bucket"
  #   key            = "static-site/terraform.tfstate"
  #   region         = "us-east-1"
  #   encrypt        = true
  #   dynamodb_table = "terraform-state-lock"
  # }
}

# Provider configuration
provider "aws" {
  region = var.aws_region
  
  default_tags {
    tags = {
      Environment = var.environment
      ManagedBy   = "Terraform"
      Project     = "StaticSite"
    }
  }
}

# Additional provider for ACM (must be us-east-1 for CloudFront)
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
  
  default_tags {
    tags = {
      Environment = var.environment
      ManagedBy   = "Terraform"
      Project     = "StaticSite"
    }
  }
}

# S3 Static Site Module
module "s3_static_site" {
  source = "./modules/s3"
  
  bucket_name = var.bucket_name
  index_file  = var.index_file
  error_file  = var.error_file
  environment = var.environment
  
  tags = var.tags
}

# ACM Certificate Module (must be in us-east-1 for CloudFront)
module "acm_cert" {
  source = "./modules/acm"
  
  providers = {
    aws = aws.us_east_1
  }
  
  domain_name             = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method       = var.validation_method
  
  tags = var.tags
}

# CloudFront Module
module "cloudfront" {
  source = "./modules/cloudfront"
  
  # Explicit dependency on other modules
  depends_on = [
    module.s3_static_site,
    module.acm_cert
  ]
  
  domain_name            = var.domain_name
  domain_aliases         = concat([var.domain_name], var.subject_alternative_names)
  acm_certificate_arn    = module.acm_cert.certificate_arn
  s3_bucket_name         = module.s3_static_site.bucket_name
  s3_bucket_domain_name  = module.s3_static_site.bucket_regional_domain_name
  s3_bucket_id           = module.s3_static_site.bucket_id
  origin_access_identity = module.s3_static_site.cloudfront_oai_path
  
  price_class            = var.cloudfront_price_class
  default_root_object    = var.index_file
  environment            = var.environment
  
  tags = var.tags
}

# Optional: Route53 Module for DNS management
# module "route53" {
#   source = "./modules/route53"
#   
#   domain_name            = var.domain_name
#   cloudfront_domain_name = module.cloudfront.distribution_domain_name
#   cloudfront_hosted_zone = module.cloudfront.distribution_hosted_zone_id
#   
#   tags = var.tags
# }
