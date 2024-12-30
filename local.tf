#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*             Locals values                             *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#


locals {
  location            = "East Asia"
  resource_group_name = "app-grp"
  virtual_network = {
    name          = "app-network"
    address_space = "10.0.0.0/16"
  }
  backend_address_pool_name      = "${azurerm_virtual_network.appnetwork.name}-beap"
  frontend_port_name             = "${azurerm_virtual_network.appnetwork.name}-feport"
  frontend_ip_configuration_name = "${azurerm_virtual_network.appnetwork.name}-feip"
  http_setting_name              = "${azurerm_virtual_network.appnetwork.name}-be-htst"
  listener_name                  = "${azurerm_virtual_network.appnetwork.name}-httplstn"
  request_routing_rule_name      = "${azurerm_virtual_network.appnetwork.name}-rqrt"
  redirect_configuration_name    = "${azurerm_virtual_network.appnetwork.name}-rdrcfg"
  # subnets = [
  #   {
  #     name = "subnetA"
  #     address_prefixes = "10.0.1.0/24"
  #   },
  #   {
  #     name = "subnetB"
  #     address_prefixes = "10.0.2.0/24"
  #   }
  # ]
}