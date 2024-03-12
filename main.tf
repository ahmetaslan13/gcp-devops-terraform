resource "random_id" "bucket_prefix" {
  byte_length = 8
}

# Data Source to get Project ID
data "google_project" "current" {}

# Resource Definition - Google Storage Bucket
resource "google_storage_bucket" "my_bucket" {
  name          = "${data.google_project.current.project_id}-bucket-tfstate"  # Using the project ID from provider configuration
  location      = "US"                             # Location of the bucket
  force_destroy = false                             # Allow Terraform to delete the bucket even if it contains objects
  
  # Additional configuration options can be added here as needed
}

resource "google_storage_bucket" "random_bucket" {
  name          = "${random_id.bucket_prefix.hex}-bucket"
  location      = "US"                             # Location of the bucket
  force_destroy = false                             # Allow Terraform to delete the bucket even if it contains objects
  
  # Additional configuration options can be added here as needed
}

