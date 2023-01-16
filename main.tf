terraform {
  cloud {
    organization = "eyc"

    workspaces {
      name = "eyc-github-prod"
    }
    
  }
}

provider "aws" {
    region = "${var.region}"
}

module "s3" {
    source = "../ben-iac/S3"
    #bucket name should be unique
    bucket_name = "bens3-50187655"       
}

