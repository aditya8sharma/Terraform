terraform{
    required_version = ">=1.2.0"
}

provider "aws" {}


data "aws_caller_identity" "current" {}

locals {
    account_id = data.aws_caller_identity.current.account_id
}

resource "aws_s3_bucket" "terraform-state" {
    bucket = "${local.account_id}-terraform-state"
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
    bucket = aws_s3_bucket.terraform-state.id

    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
    bucket = aws_s3_bucket.terraform-state.id
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm     = "AES256"
        }
    }
}

resource "aws_dynamodb_table" "terraform-lock" {
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "LockID"
  name             = "terraform-lock"


  attribute {
    name = "LockID"
    type = "S"
  }
}
