#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*        RESOURCES - Application Gateway                *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#


# resource "azurerm_public_ip" "appgwpubip" {
#   name                = "appgw-pip"
#   resource_group_name = local.resource_group_name
#   location            = local.location
#   allocation_method   = "Static"
# }

# resource "azurerm_application_gateway" "appgw" {
#   name                = "app-gateway"
#   resource_group_name = local.resource_group_name
#   location            = local.location

#   sku {
#     name     = "Standard_v2"
#     tier     = "Standard_v2"
#     capacity = 1
#   }

#   gateway_ip_configuration {
#     name      = "my-gateway-ip-configuration"
#     subnet_id = azurerm_subnet.subnets[2].id
#   }

#   frontend_port {
#     name = local.frontend_port_name
#     port = 80
#   }

#   frontend_ip_configuration {
#     name                 = local.frontend_ip_configuration_name
#     public_ip_address_id = azurerm_public_ip.appgwpubip.id
#   }

#   frontend_ip_configuration {
#     name                          = "${local.frontend_ip_configuration_name}-private"
#     subnet_id                     = azurerm_subnet.subnets[2].id
#     private_ip_address_allocation = "Static"
#     private_ip_address            = "10.0.2.10"
#   }

#   backend_address_pool {
#     name = local.backend_address_pool_name
#   }

#   backend_http_settings {
#     name                  = local.http_setting_name
#     cookie_based_affinity = "Disabled"
#     path                  = "/"
#     port                  = 80
#     protocol              = "Http"
#     request_timeout       = 60
#   }

#   http_listener {
#     name                           = local.listener_name
#     frontend_ip_configuration_name = local.frontend_ip_configuration_name
#     frontend_port_name             = local.frontend_port_name
#     protocol                       = "Http"
#   }
#   http_listener {
#     name                           = "${local.listener_name}-private"
#     frontend_ip_configuration_name = "${local.frontend_ip_configuration_name}-private"
#     frontend_port_name             = local.frontend_port_name
#     protocol                       = "Http"
#   }

#   request_routing_rule {
#     name                       = local.request_routing_rule_name
#     priority                   = 9
#     rule_type                  = "Basic"
#     http_listener_name         = local.listener_name
#     backend_address_pool_name  = local.backend_address_pool_name
#     backend_http_settings_name = local.http_setting_name
#   }
#   request_routing_rule {
#     name                       = "${local.request_routing_rule_name}-private"
#     priority                   = 10
#     rule_type                  = "Basic"
#     http_listener_name         = "${local.listener_name}-private"
#     backend_address_pool_name  = local.backend_address_pool_name
#     backend_http_settings_name = local.http_setting_name
#   }
# }