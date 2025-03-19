resource "aws_s3_bucket" "static_website" {
  bucket = var.bucket_name
  tags = {
    Name        = "my-secure-static-site"
    Environment = "Prod"
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  lifecycle {
    prevent_destroy = false
  }
}

# Enable Lifecycle Rule (optional)
resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.static_website.id

  rule {
    id = "delete-old-versions"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.static_website.id
  versioning_configuration {
    status = "Enabled"
  }
}


# Upload index.html to S3
resource "aws_s3_object" "website_index" {
  bucket = aws_s3_bucket.static_website.id
  key    = "index.html"
  source = "C:\\Users\\1090079.ANALANCE\\Documents\\Terraform_projects\\AWS_S3_Bucket_Terraform\\websites\\index.html"
  content_type = "text/html"
}


# Upload error.html to S3
resource "aws_s3_object" "website_error" {
  bucket = aws_s3_bucket.static_website.bucket
  key    = "error.html"
  source = "C:\\Users\\1090079.ANALANCE\\Documents\\Terraform_projects\\AWS_S3_Bucket_Terraform\\websites\\error.html"
  content_type = "text/html"
}


resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.static_website.bucket
  policy = templatefile("${path.module}/policy.json", {
    BUCKET_NAME     = aws_s3_bucket.static_website.id
    CLOUDFRONT_ARN = var.cloudfront_arn
  })
}


resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.static_website.id

  block_public_acls       = true
  block_public_policy     = true  # ✅ Allow public bucket policies
  ignore_public_acls      = true
  restrict_public_buckets = true
}
