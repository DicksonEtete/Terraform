provider "aws" {
  shared_credentials_files = ["<path to credentials>"]
  region = var.region
}
