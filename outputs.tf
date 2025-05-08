# outputs.tf

output "source_bucket_arn" {
  value = module.s3.source_bucket_arn
}

output "destination_bucket_arn" {
  value = module.s3.destination_bucket_arn
}

output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}

output "sns_topic_arn" {
  value = module.sns.sns_topic_arn
}
