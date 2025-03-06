
terraform {
  required_version = ">= 1.9.8"
  required_providers {
    archive = {
      source = "hashicorp/archive" # https://registry.terraform.io/providers/hashicorp/archive/latest
    }
    aws = {
      source  = "hashicorp/aws" # https://registry.terraform.io/providers/hashicorp/aws/latest
      version = "~> 5.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare" # https://registry.terraform.io/providers/cloudflare/cloudflare/latest
      version = "~> 3.0"
    }
    datadog = {
      source  = "datadog/datadog" # https://registry.terraform.io/providers/datadog/datadog/latest
      version = "~> 3.0"
    }
    external = {
      source = "hashicorp/external" # https://registry.terraform.io/providers/hashicorp/external/latest
    }
    github = {
      source  = "integrations/github" # https://registry.terraform.io/providers/integrations/github/latest
      version = "~> 6.0"
    }
    helm = {
      source = "hashicorp/helm" # https://registry.terraform.io/providers/hashicorp/helm/latest
    }
    http = {
      source  = "hashicorp/http" # https://registry.terraform.io/providers/hashicorp/http/latest
      version = "~> 3.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes" # https://registry.terraform.io/providers/hashicorp/kubernetes/latest
    }
    mongodbatlas = {
      source  = "mongodb/mongodbatlas" # https://registry.terraform.io/providers/mongodb/mongodbatlas/latest
      version = "~> 1.0"
    }
    null = {
      source = "hashicorp/null"
    }
    random = {
      source = "hashicorp/random" # https://registry.terraform.io/providers/hashicorp/random/latest
    }
  }
}
