terraform {
  # The configuration for this backend will be filled in by Terragrunt
  required_version = ">= 0.12.18"
  required_providers {
    google      = ">= 3.8"
    google-beta = ">= 3.8"
  }
}

provider "google" {}

provider "google-beta" {}
