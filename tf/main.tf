resource "google_project_service" "artifactregistry" {
  service = "artifactregistry.googleapis.com"
}

resource "google_artifact_registry_repository" "docker-repo" {
  location      = var.gcp_region
  repository_id = "docker-images"
  description   = "Repository for images running on k8s"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}