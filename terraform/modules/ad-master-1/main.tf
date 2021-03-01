provider "aws" {
  region = var.deployment_config.aws_region
  assume_role {
    role_arn = var.deployment_config.role_arn
  }
}


terraform {
  backend "s3" {
    bucket = "aws-traiana-sandbox-terraform-state-us-east-1"
    key    = "tf-adds/traiana-sandbox/adds_test_sandbox.tfstate"
    region = "us-east-1"
  }
}