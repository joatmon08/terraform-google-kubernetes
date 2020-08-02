variable "enable_workload_identity" {
  type        = bool
  description = "release toggle to enable resources and new cluster for workload identity"
  default     = false
}

variable "enable_highmem_nodepool" {
  type        = bool
  description = "ops toggle to enable highmem instance types"
  default     = false
}