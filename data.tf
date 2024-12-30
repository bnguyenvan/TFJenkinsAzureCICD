#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*             Data Imported from Azure                  *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#


data "azurerm_resource_group" "app-rg" {
  name = local.resource_group_name
}
data "azurerm_key_vault" "keyvault26122024" {
  name                = "keyvault26122024"
  resource_group_name = data.azurerm_resource_group.app-rg.name
}

data "azurerm_key_vault_secret" "vmusername" {
  name         = "vmusername"
  key_vault_id = data.azurerm_key_vault.keyvault26122024.id
}
data "azurerm_key_vault_secret" "vmpassword" {
  name         = "vmpassword"
  key_vault_id = data.azurerm_key_vault.keyvault26122024.id
}