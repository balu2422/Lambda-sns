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
}

# IAM Module: Lambda Execution Role (No lambda_name argument passed)
module "iam" {
  source = "./modules/iam"
}

# Lambda Module: Image Resizing Lambda Function
module "lambda" {
  source           = "./modules/lambda"
}
