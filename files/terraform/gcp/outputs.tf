output "public_ip" {
  value = google_compute_instance.deepfence-management-console.network_interface.0.access_config.0.nat_ip
}