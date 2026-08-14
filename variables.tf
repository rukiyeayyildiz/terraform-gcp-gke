variable "gke_config" {
  type = map(any)
  default = {
    cluster_name = "project-cluster"
    location = "us-central1"
    node_count = 1
    min_node_count = 1
    max_node_count = 2
    machine_type = "e2-medium"
    disk_size_gb = "100"
    disk_type = "pd-balanced"
  }
}
variable "node_locations" {
  type    = list(string)
  default = []
}

variable "configure_local_kubeconfig" {
  description = "Whether to run gcloud get-credentials after cluster creation on the local machine"
  type        = bool
  default     = true
}
