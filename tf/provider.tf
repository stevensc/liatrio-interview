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
  }
  cloud {
    organization = "Liatrio-demo-cstevens"
    workspaces {
      name = "liatrio-interview"
    }
  }
}

provider "google" {
  credentials = var.gcp_credentials
}

provider "google-beta" {
  credentials = var.gcp_credentials
}