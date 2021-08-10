variable "region" {
  default = "us-west1-a"
  # Oregon
}

variable "subnetwork_region" {
  default = "us-west1"
}

variable "network" {
  default = "deepfence-network"
}

variable "machine_type" {
  default = "custom-8-15360"
}

variable "hostname" {
  default = "deepfence-management-console"
}

variable "username" {
  default = "ubuntu"
}

variable "ssh_private_key" {
  description = "SSH private key file path"
}

variable "ssh_public_key" {
  description = "SSH public key file path"
}

variable "gcp_project_id" {
  description = "GCP Project ID"
}

variable "gcp_service_account_json" {
  description = "Service account JSON file path"
}