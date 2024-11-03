provider "google" {
  project     = "qwiklabs-gcp-01-8d7da656cd9d"
  region      = "us-west1"
}
resource "google_storage_bucket" "test-bucket-for-state" {
  name        = "qwiklabs-gcp-01-8d7da656cd9d"
  location    = "US" # Replace with EU for Europe region
  uniform_bucket_level_access = true
}
terraform {
  backend "gcs" {
    bucket  = "qwiklabs-gcp-01-8d7da656cd9d"
    prefix  = "terraform/state"
  }
}
