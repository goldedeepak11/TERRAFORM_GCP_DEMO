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

## 📁 Repo Structure

# Example:
make terra-destroy DIR_PATH=./bucket
Useful Gcloud cli commands:
gcloud init                                          # Connect to an account + add config
gcloud auth list                                     # List of authenticated accounts accounts
gcloud config configurations list                    # List configured accounts
gcloud config configurations activate <ACCOUNT NAME> # Change between accounts
gcloud config configurations describe <ACCOUNT NAME> #
gcloud projects list                                 # List projets linked to an account
gcloud config set project <PROJECT ID>               # Set project
gcloud components list                               # list installed components
gcloud components install <NAME>                     # install components

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
