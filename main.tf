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
    source = "./S3"
    #bucket name should be unique test
    bucket_name = "bens3-50187655"       
}
#hi matt
