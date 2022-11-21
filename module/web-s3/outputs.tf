output "bucket_arn" {
  description = "ARN du bucket"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "bucket_name" {
    description = "le nom du bucket S3"
    value = aws_s3_bucket.s3_bucket.bucket
  
}

output "bucket_id" {
  description = "l'ID du bucket S3"
  value       = aws_s3_bucket.s3_bucket.id
}

output "domain" {
  description = "le nom du domain du site web dans le bucket"
  value       = aws_s3_bucket_website_configuration.s3_bucket.website_domain
}