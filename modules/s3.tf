# modules/s3.tf

resource "aws_s3_bucket" "source_bucket" {
  bucket = "image-non-sized-1"
  acl    = "private"
}

resource "aws_s3_bucket" "destination_bucket" {
  bucket = "image-sized-1"
  acl    = "private"
}

output "source_bucket_arn" {
  value = aws_s3_bucket.source_bucket.arn
}

output "destination_bucket_arn" {
  value = aws_s3_bucket.destination_bucket.arn
}
