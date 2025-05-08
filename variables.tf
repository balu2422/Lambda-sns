
variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "topic_name" {
  description = "SNS topic name"
  type        = string
}

variable "email_endpoint" {
  description = "Email address for SNS subscription"
  type        = string
}

variable "lambda_name" {
  description = "Lambda function name"
  type        = string
}
