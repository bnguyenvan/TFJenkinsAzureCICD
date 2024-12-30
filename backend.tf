#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*             BACKEND FOR .TFSTATE                      *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#


terraform {
    backend "azurerm" {
      resource_group_name  = "app-grp"
      storage_account_name = "tfstatelab29nov25"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
    }
}