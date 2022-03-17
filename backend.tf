terraform {
  backend "s3" {
    bucket = "myw-dev-tf-state-bucket"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "myw-dynamodb-table"
  }
}
