variable "bucket_name" {
  description = "Nome do bucket S3"
  type        = string
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

output "bucket_id" {
  description = "ID do bucket S3"
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "ARN do bucket S3"
  value       = aws_s3_bucket.this.arn
}
