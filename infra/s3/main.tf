variable "name" {

}
variable "index" {
  default = "index.html"
}
variable "error" {
  default = "index.html"
}
variable "force_destroy" {
  default = false
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.name}"
  acl = "public-read"
  //Required http://amzn.to/2Fa04ul explains why.
  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${var.name}/*"]
    }
  ]
}
POLICY

  website {
    index_document = "${var.index}"
    error_document = "${var.error}"
  }

  force_destroy = "${var.force_destroy}"
}


output "website_endpoint" {
  value = "${aws_s3_bucket.bucket.website_endpoint}"
}