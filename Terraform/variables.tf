variable "aws_region" {
  description = "AWS region for resources (except ACM which must be us-east-1)"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
  
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod"
  }
}

variable "domain_name" {
  description = "Primary domain name for the static site"
  type        = string
}

variable "subject_alternative_names" {
  description = "Additional domain names for the certificate"
  type        = list(string)
  default     = []
}

variable "bucket_name" {
  description = "Name of the S3 bucket for static site content"
  type        = string
}

variable "index_file" {
  description = "Default index document"
  type        = string
  default     = "index.html"
}

variable "error_file" {
  description = "Default error document"
  type        = string
  default     = "error.html"
}

variable "validation_method" {
  description = "Method to use for certificate validation (DNS or EMAIL)"
  type        = string
  default     = "DNS"
  
  validation {
    condition     = contains(["DNS", "EMAIL"], var.validation_method)
    error_message = "Validation method must be DNS or EMAIL"
  }
}

variable "cloudfront_price_class" {
  description = "CloudFront price class"
  type        = string
  default     = "PriceClass_100"
  
  validation {
    condition     = contains(["PriceClass_All", "PriceClass_200", "PriceClass_100"], var.cloudfront_price_class)
    error_message = "Invalid price class"
  }
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}
