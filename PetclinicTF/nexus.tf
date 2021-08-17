resource "google_compute_address" "NexusIP" {
  name = "nexus-ip"
}

resource "google_compute_instance" "Nexus" {
  name         = "nexus"
  machine_type = "e2-micro"
  zone         = var.availability_zone

  boot_disk {
    initialize_params {
      image = "centos-7-v20170719"
    }
  }
  network_interface {
    network    = google_compute_network.PetclinicVPC.id
    subnetwork = google_compute_subnetwork.PetclinicSubnet.id
    access_config {
      nat_ip = google_compute_address.NexusIP.address
    }
  }
  metadata = {
    ssh-keys = file("~/.ssh/google_ssh.pub")
  }
}
