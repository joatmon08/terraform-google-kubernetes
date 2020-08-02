resource "google_container_cluster" "feature_flags" {
  count                    = var.enable_workload_identity ? 1 : 0
  provider                 = google-beta
  name                     = "${var.environment}-feature-flags-${var.version_identifier}"
  location                 = var.zone
  initial_node_count       = 1
  remove_default_node_pool = true

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  workload_identity_config {
    identity_namespace = "${data.google_project.project.id}.svc.id.goog"
  }
}

resource "google_container_node_pool" "feature_flags" {
  count      = var.enable_workload_identity ? 1 : 0
  provider   = google-beta
  name       = "${var.environment}-feature-flags-node-pool-${var.version_identifier}"
  location   = var.zone
  cluster    = google_container_cluster.feature_flags.0.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = var.enable_highmem_nodepool ? "n1-highmem-2" : "e2-medium"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  lifecycle {
    create_before_destroy = true
  }
}