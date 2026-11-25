# Bucket

resource "aws_s3_bucket" "my-bucket" {
  bucket = "${var.my-env}aws-free-bucket"

  tags = {
    name = "${var.my-env}aws-free-bucket"
  }
}
