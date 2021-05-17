module "cluster" {
  source = "./terraform-aws-kubeadm"

  cluster_name         = "simple-kube"
  master_instance_type = "t3.medium"
  worker_instance_type = "t3.small"
  num_workers          = "2"

  # Defining CIDR range based on nodes subnets to setup pods networking and deploying flannel components
  pod_network_cidr_block = "172.31.0.0/16"

  # Specifying the first applied AMI (2021-05). No need to be replaced by terraform all the time
  # ami = "ami-0fee04b212b7499e2"

  private_key_file = "~/.ssh/test-key.pem"
  public_key_file  = "~/.ssh/public_keys/test-key.pub"

  tags = {
    Name    = "simple-kube"
    Purpose = "test kubernetes"
  }
}
