data "google_service_account" "feature_flags" {
  account_id = var.service_account_id
}

resource "google_service_account_iam_binding" "feature_flags_workload_identity" {
  service_account_id = data.google_service_account.feature_flags.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project}.svc.id.goog",
  ]
}