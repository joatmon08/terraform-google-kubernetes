data "google_service_account" "feature_flags" {
  count      = var.enable_workload_identity ? 1 : 0
  account_id = var.service_account_id
}

resource "google_service_account_iam_binding" "feature_flags_workload_identity" {
  count              = var.enable_workload_identity ? 1 : 0
  service_account_id = data.google_service_account.feature_flags.0.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project}.svc.id.goog",
  ]
}