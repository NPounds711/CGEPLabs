output "bucket_name" {
  description = "Name of the primary data bucket."
  value       = aws_s3_bucket.primary.id
}

output "bucket_arn" {
  description = "ARN of the primary data bucket."
  value       = aws_s3_bucket.primary.arn
}

output "log_bucket_arn" {
  description = "ARN of the access-log bucket."
  value       = aws_s3_bucket.log.arn
}

output "encryption_algorithm" {
  description = "Server-side encryption algorithm in effect (SC-28 attestation)."
  value = one([
    for r in aws_s3_bucket_server_side_encryption_configuration.primary.rule :
    one([for d in r.apply_server_side_encryption_by_default : d.sse_algorithm])
  ])
}
