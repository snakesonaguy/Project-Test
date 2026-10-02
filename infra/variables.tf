variable "aws_region" {
  description = "AWS region for S3 and the CloudFront ACM certificate (must be us-east-1 for CloudFront)."
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "Apex domain for the site."
  type        = string
  default     = "blasiol.com"
}

variable "bucket_name" {
  description = "Private S3 bucket that holds the static site."
  type        = string
  default     = "blasiol-com-site"
}

variable "hosted_zone_id" {
  description = "Existing Route 53 hosted zone. Terraform will not create or delete this zone."
  type        = string
  default     = "Z0983518LPGNWRT3A0L7"
}
