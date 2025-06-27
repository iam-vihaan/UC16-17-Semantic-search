resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "UC1617-semeantic-search" {
  bucket = "${var.bucket_name}-${random_id.bucket_id.hex}"
  tags   = var.tags
}
