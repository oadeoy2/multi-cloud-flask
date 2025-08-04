resource "azurerm_dns_zone" "flask_dns" {
  name                = "inthecloudforall.com" # use your custom domain
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_dns_a_record" "aks_record" {
  name                = "aks"
  zone_name           = azurerm_dns_zone.flask_dns.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 300
  records             = ["134.33.175.184"]
}
