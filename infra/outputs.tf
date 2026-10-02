output "site_url" {
  description = "Canonical HTTPS URL for the site."
  value       = "https://${var.domain_name}"
}

output "www_url" {
  description = "www hostname; CloudFront redirects it to the apex."
  value       = "https://${local.www_domain}"
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain."
  value       = aws_cloudfront_distribution.site.domain_name
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID."
  value       = aws_cloudfront_distribution.site.id
}

output "s3_bucket" {
  description = "Private origin bucket."
  value       = aws_s3_bucket.site.bucket
}

output "certificate_arn" {
  description = "ACM certificate ARN in us-east-1."
  value       = aws_acm_certificate.site.arn
}
