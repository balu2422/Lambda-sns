# modules/lambda.tf

resource "aws_lambda_function" "image_resizer" {
  function_name = "image-resizer"
  handler       = "app.lambda_handler"
  runtime       = "python3.9"
  filename      = "function.zip"
  source_code_hash = filebase64sha256("function.zip")
  role          = aws_iam_role.lambda_exec_role.arn

  layers = [
    "arn:aws:lambda:ap-south-1:770693421928:layer:Klayers-p39-pillow:1"
  ]

  environment {
    variables = {
      BUCKET_1      = aws_s3_bucket.source_bucket.arn
      BUCKET_2      = aws_s3_bucket.destination_bucket.arn
      SNS_TOPIC_ARN = aws_sns_topic.image_resizing_topic.arn
    }
  }
}

output "lambda_function_arn" {
  value = aws_lambda_function.image_resizer.arn
}
