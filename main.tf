module "s3" {
  source      = "./modules/s3"
  bucket_name = "my-secure-static-site-9347857241"
  cloudfront_arn = module.cloudfront.cloudfront_distribution_arn
}

module "cloudfront" {
  source                = "./modules/cloudfront"
  s3_bucket_domain_name = module.s3.s3_bucket_domain_name
  
}
module "route53" {
  source                 = "./modules/route53"
  domain_name            = "securestaticwebsite.com"  # Ensure the correct domain is used
  cloudfront_domain_name = module.cloudfront.cloudfront_domain_name
  cloudfront_zone_id     = module.cloudfront.cloudfront_zone_id
}
