resource "aws_s3_bucket" "static_assets_s3_bucket" {
  bucket = data.aws_ssm_parameter.web_static_assets_s3_bucket.value
}

resource "aws_s3_bucket_public_access_block" "static_assets_s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.static_assets_s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.static_assets_s3_bucket.id
  policy = data.aws_iam_policy_document.iam_website_public_read_access.json
}

module "s3_objects_upload" {
  source                   = "./object-upload"
  assets_s3_bucket         = aws_s3_bucket.static_assets_s3_bucket.bucket
  assets_mime_content_type = "image/x-icon"
  assets_search_pattern    = "**/*.ico"
}
