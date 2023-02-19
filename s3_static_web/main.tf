resource "aws_s3_bucket" "bucket_name" {
  bucket = var.s3_bucket_name
  tags = {
    Name        = var.s3_bucket_name
    Environment = var.stage
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket_name.id
  acl    = "public-read"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.bucket_name.id
  key    = "index.html"
  source = "uploads/index.html"
  content_type    = "text/html"
  etag = filemd5("uploads/index.html")
}

data "aws_iam_policy_document" "s3_policy" {

  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.bucket_name.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.test.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "example" {
  bucket = aws_s3_bucket.bucket_name.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

##
# cloud front

resource "aws_cloudfront_origin_access_identity" "test" {
  comment = "This is a test distribution"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.bucket_name.bucket_domain_name
    origin_id   = aws_s3_bucket.bucket_name.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.test.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Some comment"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.bucket_name.id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_All"

  # 지리적 제한: 특정 국가에서만 접근하도록 화이트리스트 작성
  restrictions {
    geo_restriction {
      restriction_type = "none"
      # locations        = ["US", "CA", "GB", "DE"]
    }
  }

  tags = {
    Environment = "production"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}