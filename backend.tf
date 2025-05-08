  backend "s3" {
    bucket = "backenderyrtur"     # Replace with your bucket
    key    = "image-resizing/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
  }
