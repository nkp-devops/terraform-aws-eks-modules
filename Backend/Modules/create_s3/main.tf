resource "aws_s3_bucket" "backend_bucket" {
    bucket = var.bucket_name

    lifecycle {
      prevent_destroy = true
    }
}

resource "aws_s3_bucket_versioning" "backend_versioning" {
    bucket = aws_s3_bucket.backend_bucket.bucket
    versioning_configuration {
        status = "Enabled"
    }

    lifecycle {
      prevent_destroy = true
    }

}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend_encryption" {
    bucket = aws_s3_bucket.backend_bucket.bucket
    rule {
      apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
      }
    }

    lifecycle {
      prevent_destroy = true
    }
}