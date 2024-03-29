output "bucket_name" {
  value = aws_s3_bucket.b.bucket_domain_name
}
output "cloudfront_aliases" {
  value = aws_cloudfront_distribution.s3_distribution.aliases
}
output "cloudfront_id" {
  value = aws_cloudfront_distribution.s3_distribution.id
}
output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}