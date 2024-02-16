output "s3_bucket_name" {
    value = aws_s3_bucket.terraform-state.id
    description = "The Name of the S3 Bucket"
}

output "s3_bucket_arn" {
    value = aws_s3_bucket.terraform-state.arn
    description = "The ARN of the S3 Bucket"
}

output "s3_bucket_region" {
    value = aws_s3_bucket.terraform-state.region
    description = "The REGION of the S3 Bucket"
}

output "dynamodb_table_name" {
    value = aws_dynamodb_table.terraform-lock.name
    description = "The Name of the S3 DynamoDB table"
}

output "dynamodb_table_arn" {
    value = aws_dynamodb_table.terraform-lock.arn
    description = "The ARN of the S3 DynamoDB table"
}

