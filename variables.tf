variable "environment" {
  type        = string
  description = "environment of gke cluster. prepended to name."
}

variable "project" {
  type = string
  description = "GCP Project"
}

variable "version_identifier" {
  type        = string
  description = "version of stack. appended to name."
}

variable "service_account_id" {
  type        = string
  description = "google service account id for workload identity"
}

variable "zone" {
  type        = string
  description = "GCP Zone to deploy"
  default     = "us-central1-a"
}