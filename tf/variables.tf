variable "gcp_project_id" {
  type = string
  description = "Google Cloud project ID"
  default = ""
}

variable "gcp_region" {
  type = string
  description = "Google Cloud region"
  default = ""
}

variable "gcp_zone" {
  type = string
  description = "Google Cloud zone"
  default = ""
}

variable "gcp_credentials" {
  type = string
  sensitive = true
  description = "Google Cloud service account credentials"
  default = ""
}