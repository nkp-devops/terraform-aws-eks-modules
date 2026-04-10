terraform {
    backend "s3" {
        bucket = var.root_backend_s3_bucket_name
        key = "proda/terraform.tfstate"
        region = "ap-south-1"
        dynamodb_table = var.root_locking_dynamodb_table_name
        encrypt = true
        use_lockfile = true
    }
}