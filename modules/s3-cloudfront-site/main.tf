locals {
  resource_prefix = replace(var.name, "/", "-")
}

# S3 bucket for site content (private)
resource "aws_s3_bucket" "site" {
  bucket = local.resource_prefix
  acl    = "private"
  tags   = merge({ "Name" = local.resource_prefix }, var.tags)
}

# Block public access
resource "aws_s3_bucket_public_access_block" "block" {
  bucket                  = aws_s3_bucket.site.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Bucket policy will be attached after origin access control is created.

# CloudFront Origin Access Control (recommended over OAI)
resource "aws_cloudfront_origin_access_control" "oac" {
  name      = "${local.resource_prefix}-oac"
  description = "OAC for ${local.resource_prefix}"
  signing_behavior = "always"
  signing_protocol = "sigv4"
  origin_access_control_origin_type = "s3"
}

# IAM role not needed: CloudFront uses the OAC to sign requests to S3; we need a bucket policy allowing CloudFront principal
data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid     = "AllowCloudFrontServicePrincipal"
    effect  = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${aws_cloudfront_origin_access_control.oac.id}"]
    }
    actions = ["s3:GetObject"]
    resources = [
      "${aws_s3_bucket.site.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.site.id
  policy = data.aws_iam_policy_document.bucket_policy.json
}

# ACM certificate (optionally create in us-east-1)
# NOTE: CloudFront requires ACM cert in us-east-1. If you want Terraform to create it, run the provider with alias for us-east-1 in root module.
resource "aws_acm_certificate" "cert" {
  count  = var.create_acm_certificate && length(var.aliases) > 0 ? 1 : 0

  domain_name               = length(var.aliases) > 0 ? var.aliases[0] : var.domain_name
  subject_alternative_names = var.aliases
  validation_method         = var.certificate_validation_method
  tags                      = var.tags
  lifecycle {
    create_before_destroy = true
  }
}

# CloudFront distribution
resource "aws_cloudfront_distribution" "cdn" {
  depends_on = [aws_s3_bucket_policy.policy]

  origin {
    domain_name = aws_s3_bucket.site.bucket_regional_domain_name
    origin_id   = "s3-${aws_s3_bucket.site.id}"

    origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CDN for ${local.resource_prefix}"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = var.allowed_methods
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3-${aws_s3_bucket.site.id}"

    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  }

  price_class = var.price_class

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    # if user passed a certificate_arn, use it; otherwise use created cert if available; else use default cloudfront certificate
    acm_certificate_arn = var.certificate_arn != "" ? var.certificate_arn : (length(aws_acm_certificate.cert) > 0 ? aws_acm_certificate.cert[0].arn : null)
    ssl_support_method  = var.certificate_arn != "" || length(aws_acm_certificate.cert) > 0 ? "sni-only" : null
    minimum_protocol_version = "TLSv1.2_2021"
  }

  aliases = var.aliases

  tags = var.tags
}
