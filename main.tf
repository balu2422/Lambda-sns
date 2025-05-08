# main.tf

provider "aws" {
  region = "ap-south-1"
}

# Including all modules
module "s3" {
  source = "./modules/s3.tf"
}

module "iam" {
  source = "./modules/iam.tf"
}

module "lambda" {
  source = "./modules/lambda.tf"
}

module "sns" {
  source = "./modules/sns.tf"
}
