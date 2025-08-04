
variable "aws_region" {
  default = "us-east-1"
}

variable "aws_profile" {
  default = "default"
}

variable "cluster_name" {
  default = "flask-multicloud-eks"
}

variable "eks_elb_dns_name" {
  description = "DNS name of the EKS LoadBalancer"
  type        = string
}

variable "eks_elb_zone_id" {
  description = "Route53 zone ID of the EKS LoadBalancer"
  type        = string
}

variable "aks_lb_ip" {
  description = "Public IP of the AKS LoadBalancer"
  type        = string
}
