#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*             RESOURCES - Bastation Hosts               *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

resource "azurerm_public_ip" "bastionpip" {
  name                = "bastion-pubip"
  resource_group_name = data.azurerm_resource_group.app-rg.name
  location            = local.location
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_bastion_host" "appbastion" {
  name                = "app-bastion"
  location            = local.location
  resource_group_name = data.azurerm_resource_group.app-rg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastionsubnet.id
    public_ip_address_id = azurerm_public_ip.bastionpip.id
  }
}