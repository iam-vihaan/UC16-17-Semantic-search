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
          AWS = "arn:aws:iam::784733659029:role/lambda_exec_role"
        },
        Action = "s3:GetObject",
        Resource = "arn:aws:s3:::lambda-code-bucket-ddd/*"
      }
    ]
  })
}
