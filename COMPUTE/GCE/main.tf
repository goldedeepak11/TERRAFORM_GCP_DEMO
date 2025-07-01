provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
  credentials = "keys.json"
}

resource "google_compute_network" "default" {
  name = "gce-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default" {
  name          = "gce-subnet"
  ip_cidr_range = "10.10.0.0/16"
  region        = var.region
  network       = google_compute_network.default.id
}

# Instance 1: e2-medium, Debian OS
resource "google_compute_instance" "vm_debian" {
  name         = "vm-debian"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.default.id
    access_config {}
  }

  tags = ["web"]
}

# Instance 2: n1-standard-1, Ubuntu OS, preemptible
resource "google_compute_instance" "vm_ubuntu_preemptible" {
  name         = "vm-ubuntu-preemptible"
  machine_type = "n1-standard-1"
  zone         = var.zone

  scheduling {
    preemptible       = true
    automatic_restart = false
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.default.id
    access_config {}
  }
}

# Instance 3: e2-micro, Container-Optimized OS
resource "google_compute_instance" "vm_container_optimized" {
  name         = "vm-container-optimized"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.default.id
    access_config {}
  }

  metadata = {
    gce-container-declaration = <<EOF
spec:
  containers:
    - name: hello
      image: gcr.io/google-samples/hello-app:1.0
      ports:
        - containerPort: 8080
EOF
  }
}
