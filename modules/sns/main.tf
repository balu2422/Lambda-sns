# modules/sns.tf

resource "aws_sns_topic" "image_resizing_topic" {
  name = "image-resizing-topic"
}

# Email subscription (e.g., Gmail)
resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.image_resizing_topic.arn
  protocol  = "email"
  endpoint  = var.notification_email  # e.g., "youremail@gmail.com"
}

resource "aws_s3_bucket_notification" "source_bucket_notification" {
  bucket = aws_s3_bucket.source_bucket.bucket

  lambda_function {
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "uploads/"
    lambda_function_arn = aws_lambda_function.image_resizer.arn
  }

  depends_on = [
    aws_lambda_permission.allow_s3_to_invoke_lambda
  ]
}

resource "aws_lambda_permission" "allow_s3_to_invoke_lambda" {
  statement_id  = "AllowS3InvokeLambda"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.image_resizer.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.source_bucket.arn
}

output "sns_topic_arn" {
  value = aws_sns_topic.image_resizing_topic.arn
}
