## Google Cloud Platform - Infrastructure as Code with Terraform and GitHub Actions

This repository demonstrates how to manage Google Cloud Platform (GCP) infrastructure using Terraform and automate deployments with GitHub Actions.

### Project Overview

This project includes two Terraform configurations (`main.tf`) and two GitHub Actions workflows (`tf-apply.yml` and `tf-plan.yml`).

- **Terraform Configurations (`main.tf`, `backend.tf`, `provider.tf`):** These files define the infrastructure resources to be provisioned in GCP, including Google Cloud Storage buckets. The `backend.tf` file configures Terraform state to be stored in a Google Cloud Storage bucket.

- **GitHub Actions Workflows (`tf-apply.yml`, `tf-plan.yml`):** These workflows automate Terraform execution within the CI/CD pipeline. 
    - `tf-plan.yml`: Generates a Terraform execution plan upon pull request creation.
    - `tf-apply.yml`: Applies Terraform changes and provisions infrastructure upon pull request merge to the `main` branch.

### Prerequisites

* A GCP project with the required permissions.
* A service account with appropriate permissions for Terraform operations.
* Terraform installed locally.
* A GitHub repository.

### Setup

1. Configure your Terraform environment with the GCP project ID and credentials. 
2. Create secrets in your GitHub repository named:
    - `TF_API_TOKEN` (for Terraform Cloud access)
    - `GCP_SA_KEY` (for service account key in JSON format)

### Usage

**Local Development**

1. Clone this repository.
2. Update the `provider.tf` file with your GCP project ID (optional).
3. Set the `GOOGLE_CREDENTIALS` environment variable to the path of your service account key file.
4. Run `terraform init` to initialize the Terraform working directory.
5. Run `terraform plan` to preview the infrastructure changes.
6. Run `terraform apply` to apply the changes and provision the infrastructure (manual approval required).

**GitHub Actions**

This repository leverages GitHub Actions to automate Terraform execution within the CI/CD pipeline.

- Upon pull request creation, the `tf-plan.yml` workflow generates a Terraform execution plan.
- Upon pull request merge to the `main` branch, the `tf-apply.yml` workflow applies Terraform changes and provisions infrastructure.

**Important Note:**

- The `tf-apply.yml` workflow uses `-auto-approve` flag, which automatically approves Terraform apply without manual intervention.  **Use this flag with caution in production environments.**

