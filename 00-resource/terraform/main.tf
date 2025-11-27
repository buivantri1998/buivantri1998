terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

data "google_compute_image" "nginx" {
  family  = "nginx-base"
  project = "user-jvvafnaemxwf"
}

provider "google" {
  project = "user-jvvafnaemxwf"
  region  = "asia-southeast1"
  zone    = "asia-southeast1-b"
}

resource "google_compute_instance" "nginx" {
  name         = "nginx-vm"
  machine_type = "e2-micro"
  zone         = "asia-southeast1-b"

  boot_disk {
    initialize_params {
      #image = "debian-cloud/debian-12"
      image = data.google_compute_image.nginx.self_link
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["web", "nginx", "allow-80-traffic"]
}

resource "google_compute_firewall" "allow_http_ingress" {
  name        = "allow-http-ingress-rule"
  network     = "projects/user-jvvafnaemxwf/global/networks/default"
  description = "Allows http ingress traffic to instances with 'http-enabled' tag."

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"] # Allows traffic from all IP ranges
  target_tags   = ["http-enabled","allow-80-traffic"] # Applies to instances with this tag
  direction     = "INGRESS"
  priority      = 1000 # Lower numbers indicate higher priority
}