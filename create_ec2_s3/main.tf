provider "aws" {
    access_key = ""
    secret_key = ""
    region = "ap-south-1"
} 

resource "aws_instance" "my_instance" {
    ami = "ami-00bb6a80f01f03502"
    instance_type = "t2.micro"
    key_name = "feb-2025"
    tags = {
        Name = "Terraform_EC2"
    }
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "my-bucket-839265872354-test-s3"
}

resource "aws_s3_bucket_versioning" "enable_versioning" {
    bucket = aws_s3_bucket.my_bucket.bucket
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse_enable" {
    bucket = aws_s3_bucket.my_bucket.bucket
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
}