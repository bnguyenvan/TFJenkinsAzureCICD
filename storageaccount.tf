resource "azurerm_storage_account" "appstorage576848577554" {
  name                     = "appstorage576848577554"
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
}

resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_id    = azurerm_storage_account.appstorage576848577554.id
  container_access_type = "blob"
  depends_on = [ azurerm_storage_account.appstorage576848577554 ]
}