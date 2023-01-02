output "bucket_name" {
  value = aws_s3_bucket.bucket_name.bucket_domain_name
}

output "web_url" {
  value = aws_s3_bucket_website_configuration.webconfig.website_endpoint
}
