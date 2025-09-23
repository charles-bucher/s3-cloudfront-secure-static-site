variable "aws_region" {
  default = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
}

variable "domain_name" {
  description = "Domain for ACM certificate"
}