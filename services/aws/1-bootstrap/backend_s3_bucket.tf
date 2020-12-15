resource "aws_s3_bucket" "terraform_lock" {
  # bucket = var.bucket
  # bucket = "terraform-eks-pipeline"
  bucket = "terraform-pipeline-eks-app"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }
  tags = {
    Name = "S3 Remote Terraform State Store"
  }
}
