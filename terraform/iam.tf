data "aws_iam_policy_document" "iam_website_public_read_access" {
  statement {
    effect = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.static_assets_s3_bucket.arn}/*",
    ]
  }
}
