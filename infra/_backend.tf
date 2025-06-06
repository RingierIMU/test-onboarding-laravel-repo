# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 #
# 💥                                                            💥 #
# 💥 Do not edit this file as it will be overwritten!           💥 #
# 💥                                                            💥 #
# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 #

# See: https://www.terraform.io/docs/backends/types/s3.html
# unfortunately no interpolation
terraform {
  backend "s3" {
    bucket  = "rimu-tf-state"
    key     = "test-onboarding-laravel-repo/terraform.tfstate"
    region  = "eu-west-1"
    profile = "rimu"

    encrypt    = true
    kms_key_id = "alias/base/s3"

    use_lockfile = true
  }
}

variable "prefix" {
  default = "ritdu-onboarding-laravel"
}

variable "prefix_short" {
  default = "onboarding-laravel"
}

variable "app_name" {
  default = "test-onboarding-laravel-repo"
}
