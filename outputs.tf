output "bucket_names" {
  description = "The name of the created S3 bucket"
  value       = module.s3.bucket_names
}
output "bucket_website_endpoint" {
  description = "The website endpoint URL of the S3 bucket"
  value       = module.s3.bucket_website_endpoint  # Use website_endpoint instead of website_url
}
output "cloudfront_distribution_arn" {
  description = "CloudFront Distribution ARN"
  value       = module.cloudfront.cloudfront_distribution_arn
}
output "route53_zone_id" {
  value = module.route53.route53_zone_id
}