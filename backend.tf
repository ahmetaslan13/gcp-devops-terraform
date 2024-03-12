terraform {
  backend "gcs" {
    bucket = "gcp-devops-terraform-416916-bucket-tfstate"
    prefix = "terraform/state"
  }
}