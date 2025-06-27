variable "bucket_name" {
  type = string
  default = "UC1617-semeantic-search"
}
variable "tags" {
  type = map(string)
}

variable "lambda_role_arn" {
  description = "IAM role ARN for Lambda"
  type        = string
}
