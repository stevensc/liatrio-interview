resource "google_artifact_registry_repository" "docker-repo" {
  project       = var.gcp_project_id
  location      = var.gcp_region
  repository_id = "docker-images"
  description   = "Repository for images running on k8s"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}