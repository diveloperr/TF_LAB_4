

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "${var.name}-TerraformStateLock"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "tfstate-bucket" {
  bucket        = "${var.name}-tfstate-bucket"
  force_destroy = true
}


resource "aws_s3_bucket" "log_bucket" {
  bucket        = "${var.name}-tf-log-bucket"
  force_destroy = true
}


resource "aws_s3_bucket_ownership_controls" "tfstate-bucket" {
  bucket = aws_s3_bucket.tfstate-bucket.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_ownership_controls" "log_bucket" {
  bucket = aws_s3_bucket.log_bucket.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_acl" "tfstate-bucket-acl" {
  bucket     = aws_s3_bucket.tfstate-bucket.id
  depends_on = [aws_s3_bucket_ownership_controls.tfstate-bucket]
  acl        = "private"
}
resource "aws_s3_bucket_versioning" "tfstate-bucket_versioning" {
  bucket = aws_s3_bucket.tfstate-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "log_bucket_acl" {
  bucket     = aws_s3_bucket.log_bucket.id
  depends_on = [aws_s3_bucket_ownership_controls.log_bucket]
  acl        = "log-delivery-write"
}

resource "aws_s3_bucket_logging" "log_bucket_logging" {
  bucket = aws_s3_bucket.tfstate-bucket.id

  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/"
}


