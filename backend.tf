terraform {
  backend "s3" {
    bucket         = Charles-s3
    key            = "s3-cloudfront-secure-static-site/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}