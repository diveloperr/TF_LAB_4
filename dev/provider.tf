
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.9.0"
    }
  }
}

provider "aws" {
  profile = "tf-user"
  region  = "ap-northeast-2"
}


terraform {
  
  backend "local" {
    path = "../tfstate/dev/terraform.tfstate"
  }
  
  /*
  backend s3 {
    bucket         = "shpark-tfstate-bucket" # S3 버킷 이름
    key            = "terraform/terraform.tfstate" # tfstate 저장 경로
    region         = "ap-northeast-2"
    dynamodb_table = "shpark-TerraformStateLock" # dynamodb table 이름
    acl            = "bucket-owner-full-control"
    profile = "tf-user"
  }
  */
  
}


