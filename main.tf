provider "google" {
  project = "gcp-devops-terraform-416916"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_storage_bucket" "my_bucket" {
  name     = "github-actions-1test-bucket" # Replace with your desired bucket name
  location = "US"               # Replace with your desired location

  # You can add more configuration options here as needed
}