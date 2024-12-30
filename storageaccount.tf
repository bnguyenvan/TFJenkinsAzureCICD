#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*             RESOURCES - Storage Accounts              *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

# resource "azurerm_storage_account" "appstorage576848577554" {
#   name                     = "appstorage576848577554"
#   resource_group_name      = azurerm_resource_group.app-grp.name
#   location                 = azurerm_resource_group.app-grp.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   account_kind = "StorageV2"
#   depends_on = [ azurerm_resource_group.app-grp ]
# }

# resource "azurerm_storage_container" "data" {
#   name                  = "data"
#   storage_account_id    = azurerm_storage_account.appstorage576848577554.id
#   container_access_type = "blob"
#   depends_on = [ azurerm_storage_account.appstorage576848577554 ]
# }

# resource "azurerm_storage_container" "data" {
#   count = 3
#   name                  = "data${count.index}"
#   storage_account_id    = azurerm_storage_account.appstorage576848577554.id
#   container_access_type = "blob"
#   depends_on = [ azurerm_storage_account.appstorage576848577554 ]
# }

# resource "azurerm_storage_container" "data" {
#   for_each = toset(["data1", "data2", "data3"])
#   name                  = each.key
#   storage_account_id    = azurerm_storage_account.appstorage576848577554.id
#   container_access_type = "blob"
#   depends_on = [ azurerm_storage_account.appstorage576848577554 ]
# }

# resource "azurerm_storage_blob" "picture1" {
#   name                   = "picture1.jpg"
#   storage_account_name   = azurerm_storage_account.appstorage576848577554.name
#   storage_container_name = azurerm_storage_container.data.name
#   type                   = "Block"
#   source                 = "./images/cbe72d600a148933b302135a0cda56e1.jpg"
#   depends_on = [ azurerm_storage_container.data ]
# }

# resource "azurerm_storage_blob" "picture1" {
#   for_each = {
#     "sample1" = "./data/sample1.txt",
#     "sample2" = "./data/sample2.txt",
#     "sample3" = "./data/sample3.txt"
#   }
#   name                   = "${each.key}.txt"
#   storage_account_name   = azurerm_storage_account.appstorage576848577554.name
#   storage_container_name = azurerm_storage_container.data.name
#   type                   = "Block"
#   source                 = each.value
#   depends_on = [ azurerm_storage_container.data ]
# }


# resource "azurerm_storage_share" "fileshare" {
#   name                 = "file-share"
#   storage_account_id = azurerm_storage_account.appstorage576848577554.id
#   quota                = 50
# }

# resource "azurerm_storage_share_directory" "folder1" {
#   name             = "folder1"
#   storage_share_id = azurerm_storage_share.fileshare.id
# }

# resource "azurerm_storage_share_file" "file1" {
#   name             = "file1.txt"
#   storage_share_id = azurerm_storage_share_directory.folder1.id
#   source           = "./data/sample1.txt"
# }