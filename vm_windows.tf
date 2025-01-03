# #*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
# #*             RESOURCES - Windows VMs                   *#
# #*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#


# # resource "azurerm_public_ip" "appwindowspubips" {
# #   count = var.number_of_windows_vm

# #   name                = "app-winvm-${count.index}-pubip"
# #   resource_group_name = data.azurerm_resource_group.app-rg.name
# #   location            = local.location
# #   allocation_method   = "Static"
# # }

# resource "azurerm_network_interface" "appwinnics" {
#   count = var.number_of_windows_vm

#   name                = "app-winvm-${count.index}-nic"
#   location            = local.location
#   resource_group_name = local.resource_group_name

#   ip_configuration {
#     name                          = "app-winvm-${count.index}-ip"
#     subnet_id                     = azurerm_subnet.subnets[0].id
#     private_ip_address_allocation = "Dynamic"
#     # public_ip_address_id          = azurerm_public_ip.appwindowspubips[count.index].id
#   }
# }

# resource "azurerm_windows_virtual_machine" "appwindowsvms" {
#   count = var.number_of_windows_vm

#   name                = "app-winvm-${count.index}"
#   resource_group_name = data.azurerm_resource_group.app-rg.name
#   location            = local.location
#   size                = "Standard_Ds1_v2"
#   admin_username      = data.azurerm_key_vault_secret.vmusername.value
#   admin_password      = data.azurerm_key_vault_secret.vmpassword.value
#   computer_name       = "app-winvm-${count.index}"
#   network_interface_ids = [
#     azurerm_network_interface.appwinnics[count.index].id
#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#     disk_size_gb         = 128
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2019-Datacenter"
#     version   = "latest"
#   }
# }