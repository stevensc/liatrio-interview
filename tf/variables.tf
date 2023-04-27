variable "gcp_project_id" {
  type = string
  description = "Google Cloud project ID"
}

variable "gcp_region" {
  type = string
  description = "Google Cloud region"
}

variable "gcp_zone" {
  type = string
  description = "Google Cloud zone"
}

variable "gcp_credentials" {
  type = string
  sensitive = true
  description = "Google Cloud service account credentials"
}