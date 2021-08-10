# Terraform for GCP

Terraform module to provision Deepfence ThreatMapper on GCP Compute Engine

### Initialize
```
terraform init
```

### Variables
Create a new file `terraform.tfvars` with following values
```
ssh_private_key = "~/deepfence/deepfence_console.pem"
ssh_public_key = "~/deepfence/deepfence_console_public.pem"
gcp_project_id = "deepfence-console-123456"
gcp_service_account_json = "~/deepfence/terraform-123456-458c1e0fce03.json"
```
- Setup service account in GCP: [https://cloud.google.com/docs/authentication/getting-started#cloud-console](https://cloud.google.com/docs/authentication/getting-started#cloud-console)
- This service account should have permissions to create vm
- GCP zone is set as `us-west1-a`. Please change it if needed in `vars.tf`

### Create Deepfence Management Console VM
```
terraform apply
```