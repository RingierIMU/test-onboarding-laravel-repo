
terraform {
  required_version = ">= 1.9.8"
  required_providers {
    archive = {
      source = "hashicorp/archive"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
    datadog = {
      source  = "datadog/datadog"
      version = "~> 2.0"
    }
    external = {
      source = "hashicorp/external"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
    helm = {
      source = "hashicorp/helm"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 2.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.0"
    }
    null = {
      source = "hashicorp/null"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}
