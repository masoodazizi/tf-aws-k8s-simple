provider "aws" {
  region  = "eu-central-1"
  profile = "ma-sb"
}

module "cluster" {
  source = "./terraform-aws-kubeadm"

  cluster_name         = "simple-kube"
  master_instance_type = "t3.medium"
  worker_instance_type = "t3.small"
  num_workers          = "2"

  ami = "ami-0fee04b212b7499e2" # The first applied AMI. No need to be replaced everytime

  private_key_file = "~/.ssh/test-key.pem"
  public_key_file  = "~/.ssh/public_keys/test-key.pub"

  tags = {
    Name    = "simple-kube"
    Purpose = "test kubernetes"
  }
}

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
