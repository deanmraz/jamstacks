# Configure the AWS Provider
provider "aws" {
  profile = "rtdev"
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "rtdev-terraform-states"
    key    = "jamstacks/dev/terraform.tfstate"
    region = "us-west-2"
    profile = "rtdev"
  }
}


module "demo-gridsome" {
  source = "./s3"
  name = "demo-gridsome"
}

module "demo-gatsby" {
  source = "./s3"
  name = "demo-gatsby"
}

module "demo-prember" {
  source = "./s3"
  name = "demo-prember"
}
module "demo-empress" {
  source = "./s3"
  name = "demo-empress"
}