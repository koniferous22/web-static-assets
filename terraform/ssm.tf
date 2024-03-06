data "aws_ssm_parameter" "web_static_assets_s3_bucket" {
  name = "/${local.project_name}/S3_BUCKET"
}
