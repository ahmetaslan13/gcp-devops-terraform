provider "google" {
  project     = "gcp-devops-terraform"
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_storage_bucket" "static-site" {
  name          = "image-store.com"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}