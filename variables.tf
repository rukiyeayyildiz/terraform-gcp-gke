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

# Zones the primary node pool may place nodes in. Multi-zone + location_policy
# "ANY" lets the autoscaler grow whichever zone has capacity, so a single-zone
# stockout (e.g. e2-standard-4 out in us-central1-a) no longer blocks scale-up.
# Empty = single-zone (the node pool's own location). Kept as a separate var
# because gke_config is map(any) and can't hold a list alongside scalars.
variable "node_locations" {
  type    = list(string)
  default = []
}
