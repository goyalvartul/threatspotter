data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "google_compute_firewall" "ui" {
  name = "deepfence-ui"
  network = google_compute_network.deepfence_network.name

  allow {
    protocol = "tcp"
    ports = [
      "22",
      "443"]
  }

  source_ranges = [
    "${chomp(data.http.myip.body)}/32"]
}