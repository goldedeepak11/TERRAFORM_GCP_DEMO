# TERRAFORM_GCP_DEMO
TERRAFORM POC TO CREATE GCP SERVICES

GCP Terraform tutorial
This is an introductory repo grouping terraform templates for GCP with best practices.

# 🌐 GCP Infrastructure with Terraform

This repository contains Terraform code to provision core infrastructure on **Google Cloud Platform (GCP)**, including:

- ✅ Compute Engine (GCE) VM
- ✅ Cloud Storage Bucket
- ✅ PostgreSQL Cloud SQL Instance
- ✅ Google Kubernetes Engine (GKE) Cluster

---
├── main.tf # Terraform config to provision all resources

├── variables.tf # (Optional) Input variables for flexibility

├── outputs.tf # (Optional) Outputs like IPs, DB names, etc.

├── terraform.tfvars # (Optional) Variable values

├── keys.json # GCP service account key (DO NOT COMMIT)

├── README.md # Project documentation

markdown
Copy
Edit

---

## ✅ What This Deploys

### 1. **Compute Engine VM**
- A lightweight `e2-micro` or `e2-medium` VM
- Public IP and SSH access
- Useful for admin or monitoring tasks

### 2. **Cloud Storage Bucket**
- Globally unique bucket
- Can be used for backups, file sharing, static hosting, etc.

### 3. **PostgreSQL Cloud SQL Instance**
- PostgreSQL 15 instance with `db-f1-micro` tier
- Custom user and database
- Backups enabled

### 4. **Google Kubernetes Engine (GKE) Cluster**
- Regional cluster in `us-central1`
- Default node pool with autoscaling
- Workload-ready with IP aliasing enabled

---

## ⚙️ Prerequisites

- A GCP project with billing enabled
- A GCP service account with the following roles:
  - Compute Admin
  - Kubernetes Engine Admin
  - Cloud SQL Admin
  - Storage Admin
- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
- `keys.json` service account key placed in project root (or securely injected)

---

## 🚀 How to Use

### 1. Clone the repo

```bash
git clone https://github.com/<your-org>/<your-gcp-repo>.git

cd <your-gcp-repo>

TF Code Execution
To execute the Terraform code, go to command prompt and then run the following commands:

[Required] terraform init # To initialize the terraform working directory.
[Optional] terraform validate # To validate the terraform configuration.
[Optional] terraform fmt # To format the terraform configuration to a canonical format and style.
[Optional] terraform plan # To create an execution plan for terraform configuration files.
[Required] terraform apply -auto-approve # To execute the actions proposed in a terraform plan to create, update, or destroy infrastructure.
[Optional] terraform destroy -auto-approve # To destroy the created infrastructure. Specific resources can be destroyed using resource targeting.

Caution

Run terraform destroy command with caution as it can destroy all the deployed infrastructure.

###  **REFERNCES**
https://www.terraform.io/cli
https://www.terraform.io/language
https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
https://registry.terraform.io/providers/hashicorp/google/latest/docs
https://cloud.google.com/products/calculator
https://cloud.google.com/sql/docs/postgres
https://cloud.google.com/kubernetes-engine/docs
