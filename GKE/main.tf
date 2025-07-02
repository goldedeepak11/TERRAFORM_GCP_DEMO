provider "google" {
  project     = "helpful-metric-459104-j4"
  region      = "us-central1"
  credentials = file("../keys.json")
}

resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "us-central1"

  initial_node_count = 3

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  # Enable IP aliasing (recommended)
  ip_allocation_policy {}
}

output "kubernetes_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "client_certificate" {
  value = google_container_cluster.primary.master_auth.0.client_certificate
}
