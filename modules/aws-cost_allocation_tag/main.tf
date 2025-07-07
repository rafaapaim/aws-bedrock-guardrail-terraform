terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.2.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"

  default_tags {
    tags = {
      owner      = "rafael"
      managed-by = "terraform"
    }
  }
}