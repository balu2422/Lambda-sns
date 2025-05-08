# main.tf

provider "aws" {
  region = "ap-south-1"
}

# Including all modules
module "s3" {
  source = "./modules/s3"
  ...
}

module "iam" {
  source = "./modules/iam"
  ...
}

module "sns" {
  source = "./modules/sns"
  ...
}

module "lambda" {
  source = "./modules/lambda"
  ...
}
