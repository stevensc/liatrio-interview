locals {
  cluster_type           = "simple-autopilot"
  network_name           = "simple-autopilot-network"
  subnet_name            = "simple-autopilot-subnet"
  master_auth_subnetwork = "simple-autopilot-master-subnet"
  pods_range_name        = "ip-range-pods-simple-autopilot"
  svc_range_name         = "ip-range-svc-simple-autopilot"
  subnet_names           = [for subnet_self_link in module.gcp-network.subnets_self_links : split("/", subnet_self_link)[length(split("/", subnet_self_link)) - 1]]
}

module "gke" {
  depends_on = [module.gcp-network,google_project_service.container]
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-public-cluster"
  project_id                 = var.gcp_project_id
  name                       = "${local.cluster_type}-cluster"
  region                     = var.gcp_region
  zones                      = ["us-central1-a", "us-central1-b", "us-central1-c"]
  network                    = var.gcp_region
  subnetwork                 = local.subnet_names[index(module.gcp-network.subnets_names, local.subnet_name)]
  ip_range_pods              = local.pods_range_name
  ip_range_services          = local.svc_range_name
  horizontal_pod_autoscaling = false
  enable_vertical_pod_autoscaling = true  
}

module "gcp-network" {
  depends_on = [google_project_service.compute]

  source  = "terraform-google-modules/network/google"
  version = ">= 4.0.1"

  project_id   = var.gcp_project_id
  network_name = local.network_name

  subnets = [
    {
      subnet_name   = local.subnet_name
      subnet_ip     = "10.0.0.0/17"
      subnet_region = var.gcp_region
    },
    {
      subnet_name   = local.master_auth_subnetwork
      subnet_ip     = "10.60.0.0/17"
      subnet_region = var.gcp_region
    },
  ]

  secondary_ranges = {
    (local.subnet_name) = [
      {
        range_name    = local.pods_range_name
        ip_cidr_range = "192.168.0.0/18"
      },
      {
        range_name    = local.svc_range_name
        ip_cidr_range = "192.168.64.0/18"
      },
    ]
  }
}