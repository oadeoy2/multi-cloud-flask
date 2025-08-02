module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = "flask-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Project = "MultiCloud"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  # Enable public API access so you can run kubectl from your machine
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  # Automatically grants IAM user who runs Terraform admin access
  enable_cluster_creator_admin_permissions = true

  # Define managed node group
  eks_managed_node_groups = {
    default = {
      desired_size    = 2
      max_size        = 3
      min_size        = 1
      instance_types  = ["t3.medium"]
      capacity_type   = "ON_DEMAND"
      disk_size       = 20
    }
  }

  tags = {
    Project = "MultiCloud"
  }
}

data "aws_eks_cluster_auth" "this" {
  name = module.eks.cluster_name
}


module "aws_auth" {
  source  = "terraform-aws-modules/eks/aws//modules/aws-auth"
  version = "20.8.4"

  depends_on = [module.eks]  # Ensure EKS cluster is fully ready

  manage_aws_auth_configmap = true

  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::478517495773:user/tkadmin"
      username = "tkadmin"
      groups   = ["system:masters"]
    }
  ]
}
