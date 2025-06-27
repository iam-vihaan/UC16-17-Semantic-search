resource "aws_s3_bucket" "UC16-semeantic-search" {
  bucket = var.bucket_name
  tags   = var.tags
}


resource "random_id" "bucket_id" {
  byte_length = 4
}
