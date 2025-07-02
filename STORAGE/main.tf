
resource "google_storage_bucket" "my_bucket" {
  name                        = var.bucket_name
  location                    = var.region
  force_destroy               = true           # Deletes all objects when destroying the bucket
  uniform_bucket_level_access = true           # Enforces uniform access

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }
}
