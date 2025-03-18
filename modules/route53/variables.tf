variable "domain_name" {
  description = "The domain name for Route 53"
  type        = string
}

variable "cloudfront_domain_name" {
  description = "The CloudFront domain name"
  type        = string
}

variable "cloudfront_zone_id" {
  description = "The CloudFront hosted zone ID"
  type        = string
}
