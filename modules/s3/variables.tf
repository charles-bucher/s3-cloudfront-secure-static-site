variable "name" {
  type        = string
  description = "Base name for resources (e.g. <REMOVED-your-domain.dev>)"
}

variable "domain_name" {
  type        = string
  description = "Primary domain (e.g. <REMOVED-your-domain.dev>). If empty, no custom domain."
  default     = ""
}

variable "aliases" {
  type        = list(string)
  description = "Additional domain aliases for CloudFront (e.g. [\"www.<REMOVED-your-domain.dev>\"])"
  default     = []
}

variable "create_acm_certificate" {
  type        = bool
  description = "Create an ACM certificate in us-east-1 for CloudFront. If false, pass certificate_arn."
  default     = true
}

variable "certificate_validation_method" {
  type        = string
  description = "acm validation method: DNS or EMAIL"
  default     = "DNS"
}

variable "certificate_arn" {
  type        = string
  description = "Existing ACM certificate ARN to use with CloudFront"
  default     = ""
}

variable "allowed_methods" {
  type    = list(string)
  default = ["GET", "HEAD"]
}

variable "price_class" {
  type    = string
  default = "PriceClass_100"
}

variable "enable_logging" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
