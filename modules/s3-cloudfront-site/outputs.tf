output "bucket_id" {
  value = aws_s3_bucket.site.id
}

output "bucket_arn" {
  value = aws_s3_bucket.site.arn
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.cdn.domain_name
}

output "cloudfront_id" {
  value = aws_cloudfront_distribution.cdn.id
}

output "certificate_arn" {
  value = length(aws_acm_certificate.cert) > 0 ? aws_acm_certificate.cert[0].arn : ""
}
