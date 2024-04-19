terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.45.0"
    }
  }

  required_version = "~>1.8.0"
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAYS2NQCWOGNBO3CRV"
  secret_key = "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"
}