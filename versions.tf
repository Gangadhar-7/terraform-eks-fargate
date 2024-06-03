# Terraform Settings Block
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.9"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 3.3"
    }
    external = {
      source  = "hashicorp/external"
      version = "~> 2.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 1.4"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.31.0"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    # Replace this with your bucket name!
    bucket               = "tf-rcrm-io-state-bucket-mumbai"
    key                  = "mumbai-eks-cluster/terraform.tfstate"
    workspace_key_prefix = "environments"
    region               = "ap-south-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "tf-lock-db"
    encrypt        = true
  }

  # For State Locking
  # dynamodb_table = "dev-ekscluster"
}

# Terraform Provider Block
provider "aws" {
  region = var.region
}
provider "http" {}
provider "external" {}
provider "template" {}
provider "local" {}