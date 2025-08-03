resource "azurerm_container_registry" "flask_acr" {
  name                = "flaskacr${random_integer.suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true

  tags = {
    Project = "MultiCloud"
    Environment = terraform.workspace
  }
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

output "acr_login_server" {
  value = azurerm_container_registry.flask_acr.login_server
}
