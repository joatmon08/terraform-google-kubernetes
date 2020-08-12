# GKE Cluster Terraform Module

This is a simplified example of a Terraform Module for a GKE cluster
to demonstrate feature toggles.

## Requirements

| Name | Version |
|------|---------|
| google | >= 3.34 |
| google-beta | >= 3.34 |

## Providers

| Name | Version |
|------|---------|
| google | >= 3.34 |
| google-beta | >= 3.34 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enable\_highmem\_nodepool | ops toggle to enable highmem instance types | `bool` | `false` | no |
| environment | environment of gke cluster. prepended to name. | `string` | n/a | yes |
| project | GCP Project | `string` | n/a | yes |
| service\_account\_id | google service account id for workload identity | `string` | n/a | yes |
| version\_identifier | version of stack. appended to name. | `string` | n/a | yes |
| zone | GCP Zone to deploy | `string` | `"us-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| k8s\_cluster | n/a |