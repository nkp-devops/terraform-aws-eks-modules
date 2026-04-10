module "create_backend_s3" {
    source = "./Modules/create_s3"
    bucket_name = var.root_backend_s3_bucket_name
}

module "create_dynamodb_locking_table" {
    source = "./Modules/create_DynamoDB"
    dynamodb_table_name = var.root_locking_dynamodb_table_name
}