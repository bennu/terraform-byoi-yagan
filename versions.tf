terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.0.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "1.13.3"
    }
    rke = {
      source  = "rancher/rke"
      version = ">= 1.1.3"
    }
  }
  required_version = ">= 0.13"
}