resource "aws_s3_bucket" "bens3-50187655" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "bens3-50187655" {
  bucket = aws_s3_bucket.bens3-50187655.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_acl" "ben_bucket_acl" {
  bucket = aws_s3_bucket.bens3-50187655.id
  acl    = "public-read"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bens3-50187655" {
  bucket = aws_s3_bucket.bens3-50187655.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.bens3-50187655.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["123456789012"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.bens3-50187655.arn,
      "${aws_s3_bucket.bens3-50187655.arn}/*",
    ]
  }
}


