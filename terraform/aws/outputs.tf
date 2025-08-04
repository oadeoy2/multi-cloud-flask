output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_ca" {
  value = module.eks.cluster_certificate_authority_data
}

output "eks_record_fqdn" {
  value = "eks.${aws_route53_zone.flask_dns.name}"
}

output "aks_record_fqdn" {
  value = "aks.${aws_route53_zone.flask_dns.name}"
}
