
# Had to enable manually.  Can be done automatically on project creation if using GCP organizations
resource "google_project_service" "cloudresourcemanager" {
  service = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "artifactregistry" {
  depends_on = [google_project_service.cloudresourcemanager]
  service = "artifactregistry.googleapis.com"
  disable_on_destroy = false
}

resource "google_artifact_registry_repository" "docker-repo" {
  depends_on = [google_project_service.artifactregistry]
  location      = var.gcp_region
  repository_id = "docker-images"
  description   = "Repository for images running on k8s"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}