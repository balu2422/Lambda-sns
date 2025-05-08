terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "backenderyrtur"        # 🔧 Replace with your S3 bucket name
    key    = "image-resizing/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
  }
}
