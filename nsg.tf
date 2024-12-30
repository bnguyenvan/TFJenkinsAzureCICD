#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*         RESOURCES - Network Security Groups           *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

resource "azurerm_network_security_group" "appnsg" {
  name                = "app-nsg"
  location            = local.location
  resource_group_name = local.resource_group_name

  security_rule {
    name                       = "allow_RDP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefixes      = ["183.81.81.198/32", "14.226.232.47/32"]
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow_application_gw"
    priority                   = 301
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
  }
  #   security_rule {
  #     name                       = "allow_SSH"
  #     priority                   = 300
  #     direction                  = "Inbound"
  #     access                     = "Allow"
  #     protocol                   = "Tcp"
  #     source_port_range          = "*"
  #     destination_port_range     = "22"
  #     source_address_prefix      = "14.226.222.232/32"
  #     destination_address_prefix = "*"
  #   }
  #   depends_on = [ azurerm_resource_group.app-grp ]
}

resource "azurerm_subnet_network_security_group_association" "appnsgassociation" {
  subnet_id                 = azurerm_subnet.subnets[0].id
  network_security_group_id = azurerm_network_security_group.appnsg.id
}

### NSG for Application Gateway Subnet
# resource "azurerm_network_security_group" "appgwsubnetnsg" {
#   name                = "appgw-nsg"
#   location            = local.location
#   resource_group_name = local.resource_group_name

#   security_rule {
#     name                   = "allow_all_client_to_appgw"
#     priority               = 300
#     direction              = "Inbound"
#     access                 = "Allow"
#     protocol               = "Tcp"
#     source_port_range      = "*"
#     destination_port_ranges = ["80", "443"]
#     source_address_prefix  = "*"
#     destination_address_prefixes = [
#       azurerm_public_ip.appgwpubip.ip_address,
#       azurerm_application_gateway.appgw.frontend_ip_configuration[1].private_ip_address
#     ]
#   }
#   security_rule {
#     name                   = "allow_all_from_Gateway_Manager"
#     priority               = 301
#     direction              = "Inbound"
#     access                 = "Allow"
#     protocol               = "Tcp"
#     source_port_range      = "*"
#     destination_port_range = "65200-65535"
#     source_address_prefix  = "GatewayManager"
#     destination_address_prefix = "*"
#   }
# }

# resource "azurerm_subnet_network_security_group_association" "appgwnsgassociation" {
#   subnet_id                 = azurerm_subnet.subnets[2].id
#   network_security_group_id = azurerm_network_security_group.appgwsubnetnsg.id
# }