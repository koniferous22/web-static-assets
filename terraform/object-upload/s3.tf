resource "aws_s3_object" "object_upload_ico" {
  for_each     = fileset(local.assets_root, var.assets_search_pattern)
  bucket       = var.assets_s3_bucket
  key          = each.value
  source       = "${local.assets_root}/${each.value}"
  content_type = var.assets_mime_content_type
  etag         = filemd5("${local.assets_root}/${each.value}")
}
