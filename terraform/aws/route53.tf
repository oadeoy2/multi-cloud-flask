# Hosted Zone
resource "aws_route53_zone" "flask_dns" {
  name = "inthecloudforall.com"
}

# EKS Record - Alias to AWS Load Balancer
resource "aws_route53_record" "eks_record" {
  zone_id = aws_route53_zone.flask_dns.zone_id
  name    = "eks.inthecloudforall.com"
  type    = "A"

  alias {
    name                   = var.eks_elb_dns_name       # e.g. a8c2ac4c.elb.amazonaws.com
    zone_id                = var.eks_elb_zone_id         # e.g. Z35SXDOTRQ7X7K
    evaluate_target_health = true
  }
}

# AKS Record - A record to Azure LoadBalancer IP
resource "aws_route53_record" "aks_record" {
  zone_id = aws_route53_zone.flask_dns.zone_id
  name    = "aks.inthecloudforall.com"
  type    = "A"
  ttl     = 300
  records = ["134.33.175.184"] # e.g. 134.33.175.184
}
