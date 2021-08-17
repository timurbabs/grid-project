resource "google_compute_network" "PetclinicVPC" {
  name                    = "petclinic-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "PetclinicSubnet" {
  name          = "petclinic-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.PetclinicVPC.id
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
}

resource "google_compute_firewall" "PetclinicFirewall" {
  name    = "petclinic-firewall"
  network = google_compute_network.PetclinicVPC.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080"]
  }
  source_ranges = ["0.0.0.0/0"]
}
