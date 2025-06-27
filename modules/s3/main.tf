resource "aws_s3_bucket" "UC1617-semeantic-search" {
  bucket = var.bucket_name
  tags   = var.tags
}
