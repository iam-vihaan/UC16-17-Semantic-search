resource "aws_s3_bucket" "semeantic-search" {
  bucket = var.bucket_name
  tags   = var.tags
}
