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
2. Initialize Terraform
bash
Copy
Edit
terraform init
3. (Optional) Customize variables
Edit terraform.tfvars or variables.tf if included.

4. Plan the deployment
bash
Copy
Edit
terraform plan
5. Apply the configuration
bash
Copy
Edit
terraform apply
Confirm by typing yes.
## 📁 Repo Structure


Notes:
The structure of a Terraform project can vary depending on the needs of the user and the resources being managed, but there are some common elements that are often included. A typical Terraform project may include the following files and directories:

main.tf: This is the main Terraform configuration file, which contains the instructions for building and managing the infrastructure.

variables.tf: This file contains the variables that can be used in the main.tf file, allowing users to parameterize their infrastructure.

outputs.tf: This file contains the output values that are returned by Terraform after the infrastructure has been created.

terraform.tfstate: This file contains the state of the infrastructure managed by Terraform. It is used by Terraform to track the resources it is managing, and it is updated every time Terraform is run.

terraform.tfvars: This file contains the values for the variables defined in variables.tf. These values are used by Terraform when creating the infrastructure.

providers/: This directory contains the configuration files for the provider(s) being used by Terraform. For example, if you are using the AWS provider, there would be a providers/aws.tf file in this directory.

modules/: This directory contains any Terraform modules that are being used in the project. Modules are self-contained packages of Terraform configuration that can be reused in multiple projects.
This is just an example of a possible project structure. The actual structure of a Terraform project may differ depending on the needs of the user and the resources being managed.
