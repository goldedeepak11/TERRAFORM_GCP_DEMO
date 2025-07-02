provider "google" {
  project     = "helpful-metric-459104-j4"
  region      = "us-central1"
  credentials = file("../keys.json")
}

resource "google_sql_database_instance" "postgres_instance" {
  name             = "my-postgres-instance"
  database_version = "POSTGRES_15"  # You can change version as needed
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"  # Choose machine type (db-f1-micro is smallest)
    backup_configuration {
      enabled = true
    }
    ip_configuration {
      ipv4_enabled    = true
      authorized_networks {
        value = "0.0.0.0/0"  # Replace with your IP or CIDR range for security
      }
    }
  }
}

resource "google_sql_database" "my_database" {
  name     = "mydatabase"
  instance = google_sql_database_instance.postgres_instance.name
}

resource "google_sql_user" "users" {
  name     = "dbuser"
  instance = google_sql_database_instance.postgres_instance.name
  password = "yourStrongPassword"  # Use a secure password or secrets manager
}
