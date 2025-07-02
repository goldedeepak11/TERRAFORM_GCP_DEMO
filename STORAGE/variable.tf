variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  default     = "asia-southeast1"
  description = "Bucket region"
}

variable "bucket_name" {
  type        = string
  description = "Globally unique name for the bucket"
}

