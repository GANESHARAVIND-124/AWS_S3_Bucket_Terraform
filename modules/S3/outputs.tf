output "bucket_names" {
  description = "The name of the created S3 bucket"
  value       = aws_s3_bucket.static_website.bucket
}

output "bucket_website_endpoint" {
  description = "The website endpoint URL of the S3 bucket"
  value       = aws_s3_bucket.static_website.website_endpoint  # Use website_endpoint instead of website_url
}

output "s3_bucket_domain_name" {
  description = "The S3 bucket regional domain name"
  value       = aws_s3_bucket.static_website.bucket_regional_domain_name
}

