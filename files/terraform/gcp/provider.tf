// Configure the Google Cloud provider
provider "google" {
  credentials = file(var.gcp_service_account_json)
  project = var.gcp_project_id
  region = var.subnetwork_region
}