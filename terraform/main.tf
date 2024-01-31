module "vpc" {
  source               = "./vpc_module"
  environment          = "EKS-Cluster"
  vpc_cidr             = "192.168.0.0/16"
  public_subnets_cidr  = ["192.168.1.0/24", "192.168.2.0/24"]
  private_subnets_cidr = ["192.168.3.0/24", "192.168.4.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
}


module "EKS_module" {
  source           = "./EKS-Cluster_module"
  iam-role         = "eks-cluster-demo"
  cluster_name     = "demo-eks"
  node_group_name  = "eks-nodes"
  public_subnet_1  = module.vpc.public-subnet-id-1
  public_subnet_2  = module.vpc.public-subnet-id-2
  private_subnet_1 = module.vpc.private-subnet-id-1
  private_subnet_2 = module.vpc.private-subnet-id-2
}
