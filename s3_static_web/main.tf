resource "aws_s3_bucket" "bucket_name" {
  bucket = var.s3_bucket_name
  tags = {
    Name        = var.s3_bucket_name
    Environment = var.stage
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket_name.id
  acl    = "private"
}

resource "aws_s3_bucket_website_configuration" "webconfig" {
  bucket = aws_s3_bucket.bucket_name.bucket
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
} 