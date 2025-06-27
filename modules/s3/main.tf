resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "UC1617-semeantic-search" {
  bucket = "${var.bucket_name}-${random_id.bucket_id.hex}"
  tags   = var.tags
}

resource "aws_s3_bucket_policy" "lambda_access" {
  bucket = aws_s3_bucket.UC1617-semeantic-search.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = var.lambda_role_arn
        },
        Action = "s3:GetObject",
        Resource = "${aws_s3_bucket.UC1617-semeantic-search.arn}/*"
      }
    ]
  })
}


