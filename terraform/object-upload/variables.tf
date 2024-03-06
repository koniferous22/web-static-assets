variable "assets_s3_bucket" {
  type        = string
  description = "S3 Bucket for static assets objects upload"
}

variable "assets_mime_content_type" {
  type        = string
  description = "Mime content type for uploaded assets"
}

variable "assets_search_pattern" {
  type        = string
  description = "Glob pattern for matching entries under 'static' root"
}
