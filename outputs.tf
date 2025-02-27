output "kubeconfig" {
  value       = module.cluster.kubeconfig
  description = "Location of the kubeconfig file for the created cluster on the local machine."
}

output "cluster_name" {
  value       = module.cluster.cluster_name
  description = "Name of the created cluster. This name is used as the value of the \"terraform-kubeadm:cluster\" tag assigned to all created AWS resources."
}

output "cluster_nodes" {
  value       = module.cluster.cluster_nodes
  description = "Name, public and private IP address, and subnet ID of all nodes of the created cluster."
}
