provider "aws" {
  region = "ap-south-1"
}

# S3 Module: Defining Buckets (No parameters passed as it's already handled inside the module)
module "s3" {
  source = "./modules/s3"
}

# SNS Module: Topic and Subscription
module "sns" {
  source         = "./modules/sns"
  topic_name     = "image-processing-topic"  # Hardcoded topic name
  email_endpoint = "tippuluri1998@gmail.com"  # Hardcoded email subscription
}

# IAM Module: Lambda Execution Role (No lambda_name argument passed)
module "iam" {
  source = "./modules/iam"
}

# Lambda Module: Image Resizing Lambda Function
module "lambda" {
  source           = "./modules/lambda"
  lambda_name      = "image-processor-lambda"  # Hardcoded Lambda function name
  sns_topic_arn    = module.sns.sns_topic_arn  # SNS topic ARN from sns module
  lambda_role_arn  = module.iam.lambda_exec_role_arn  # IAM role ARN from iam module
}
