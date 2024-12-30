#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*             RESOURCES - Virtual Network               *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#


resource "azurerm_virtual_network" "appnetwork" {
  name                = local.virtual_network.name
  location            = local.location
  resource_group_name = data.azurerm_resource_group.app-rg.name
  address_space       = [local.virtual_network.address_space]
}


resource "azurerm_subnet" "subnets" {
  count                = var.number_of_subnet
  name                 = "subnet${count.index}"
  resource_group_name  = data.azurerm_resource_group.app-rg.name
  virtual_network_name = azurerm_virtual_network.appnetwork.name
  address_prefixes     = ["10.0.${count.index}.0/24"]
}

resource "azurerm_subnet" "bastionsubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = data.azurerm_resource_group.app-rg.name
  virtual_network_name = azurerm_virtual_network.appnetwork.name
  address_prefixes     = ["10.0.100.0/24"]
}