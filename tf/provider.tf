terraform {
  required_version = ">= 1.1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.27"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.27"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }    
  }
  cloud {
    organization = "Liatrio-demo-cstevens"
    workspaces {
      name = "liatrio-interview"
    }
  }
}

provider "google" {
    project       = var.gcp_project_id
    credentials = var.gcp_credentials
}

provider "google-beta" {
    project       = var.gcp_project_id
    credentials = var.gcp_credentials
}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}
