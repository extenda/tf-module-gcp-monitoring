terraform {
  # The configuration for this backend will be filled in by Terragrunt
  required_version = ">= 0.12.18"
  required_providers {
    google = ">= 4.0"
  }
}
