# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 #
# 💥                                                            💥 #
# 💥 Do not edit this file as it will be overwritten!           💥 #
# 💥                                                            💥 #
# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 #

provider "aws" {
  region  = local.main_vpc_region
  profile = "rimu"

  dynamic "assume_role" {
    for_each = var.prefix == "rimu" ? [] : [1]
    content {
      role_arn = "arn:aws:iam::${local.main_account_id}:role/administrators"
    }
  }

  default_tags {
    tags = var.provider_default_tags
  }
}

provider "aws" {
  alias   = "ireland"
  region  = "eu-west-1"
  profile = "rimu"

  dynamic "assume_role" {
    for_each = var.prefix == "rimu" ? [] : [1]
    content {
      role_arn = "arn:aws:iam::${local.main_account_id}:role/administrators"
    }
  }

  default_tags {
    tags = var.provider_default_tags
  }
}

provider "aws" {
  alias   = "virginia"
  region  = "us-east-1"
  profile = "rimu"

  dynamic "assume_role" {
    for_each = var.prefix == "rimu" ? [] : [1]
    content {
      role_arn = "arn:aws:iam::${local.main_account_id}:role/administrators"
    }
  }

  default_tags {
    tags = var.provider_default_tags
  }
}

provider "aws" {
  alias   = "singapore"
  region  = "ap-southeast-1"
  profile = "rimu"

  dynamic "assume_role" {
    for_each = var.prefix == "rimu" ? [] : [1]
    content {
      role_arn = "arn:aws:iam::${local.main_account_id}:role/administrators"
    }
  }

  default_tags {
    tags = var.provider_default_tags
  }
}

provider "aws" {
  alias   = "frankfurt"
  region  = "eu-central-1"
  profile = "rimu"

  dynamic "assume_role" {
    for_each = var.prefix == "rimu" ? [] : [1]
    content {
      role_arn = "arn:aws:iam::${local.main_account_id}:role/administrators"
    }
  }

  default_tags {
    tags = var.provider_default_tags
  }
}


data "aws_caller_identity" "current" {
}

data "aws_region" "current" {
}

data "aws_availability_zones" "available" {
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_token
}

provider "random" {
}

provider "null" {
}

provider "helm" {
  kubernetes {
    config_path = var.kubectl_config_path
  }
}

provider "kubernetes" {
}

provider "external" {
}
