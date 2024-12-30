#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*             RESOURCES - Linux VMs                     *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#


# resource "azurerm_linux_virtual_machine" "appvmlinux" {
#   name                = "app-vm-linux"
#   resource_group_name = local.resource_group_name
#   location            = local.location
#   size                = "Standard_D2s_v3"
#   admin_username      = "adminuser"
#   network_interface_ids = [
#     azurerm_network_interface.appinterface.id,
#   ]

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_ed25519.pub")
#   }

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
#   depends_on = [ 
#     azurerm_resource_group.app-grp,
#     azurerm_network_interface.appinterface 
#   ]
# }