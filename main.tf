provider "aws" {
  region = "ap-south-1"
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "sns" {
  source         = "./modules/sns"
  topic_name     = var.topic_name
  email_endpoint = var.email_endpoint
}

module "iam" {
  source      = "./modules/iam"
  lambda_name = var.lambda_name
}

module "lambda" {
  source           = "./modules/lambda"
  lambda_name      = var.lambda_name
  bucket_name      = var.bucket_name
  sns_topic_arn    = module.sns.topic_arn
  lambda_role_arn  = module.iam.lambda_role_arn
}
