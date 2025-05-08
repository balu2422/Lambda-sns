# modules/iam.tf

resource "aws_iam_role" "lambda_exec_role" {
  name               = "lambda-execution-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions   = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "lambda_s3_sns_policy" {
  name        = "lambda-s3-sns-policy"
  description = "Lambda policy to access S3 and SNS"
  policy      = data.aws_iam_policy_document.lambda_s3_sns_policy.json
}

data "aws_iam_policy_document" "lambda_s3_sns_policy" {
  statement {
    actions   = ["s3:GetObject", "s3:PutObject"]
    resources = ["${aws_s3_bucket.source_bucket.arn}/*", "${aws_s3_bucket.destination_bucket.arn}/*"]
  }

  statement {
    actions   = ["sns:Publish"]
    resources = [aws_sns_topic.image_resizing_topic.arn]
  }
}

resource "aws_iam_role_policy_attachment" "lambda_exec_policy_attachment" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.lambda_s3_sns_policy.arn
}
