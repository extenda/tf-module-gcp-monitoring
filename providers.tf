terraform {
  # The configuration for this backend will be filled in by Terragrunt
  required_version = ">= 0.12.18"
}

provider "google" {
  version     = "~> 3.8"
  region      = "europe-west-1"
}
