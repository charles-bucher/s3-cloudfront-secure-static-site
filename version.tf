terraform {
  required_version = ">= 1.2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Optional but HIGHLY recommended: Remote state backend
  # Uncomment and configure when ready for team collaboration
  # backend "s3" {
  #   bucket         = "your-terraform-state-bucket"
  #   key            = "s3-cloudfront-secure-static-site/terraform.tfstate"
  #   region         = "us-east-1"
  #   encrypt        = true
  #   dynamodb_table = "terraform-state-locks"
  # }
}

# Primary provider (for most resources)
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = merge(
      var.tags,
      {
        Project     = "S3CloudFrontStaticSite"
        ManagedBy   = "Terraform"
        Environment = var.environment
      }
    )
  }
}

# Secondary provider for ACM certificates (MUST be us-east-1 for CloudFront)
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"

  default_tags {
    tags = merge(
      var.tags,
      {
        Project     = "S3CloudFrontStaticSite"
        ManagedBy   = "Terraform"
        Environment = var.environment
      }
    )
  }
}