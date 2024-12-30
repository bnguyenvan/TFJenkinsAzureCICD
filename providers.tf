terraform {
    required_providers  {
        azurerm =   {
            source  =   "hashicorp/azurerm"
            version = ">= 4.14.0"
        }
        azuread =   {
            source  =   "hashicorp/azuread"
            version =   ">= 3.0.2"
        }
    }
}

provider "azurerm" {
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    subscription_id =   var.subscription_id
    tenant_id       =   var.tenant_id
    
    features {}
}




provider "azuread" {
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    tenant_id       =   var.tenant_id
    alias           =   "ad"
}