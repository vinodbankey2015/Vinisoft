terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<= 4.65.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "mytestrg" {
  name     = "test-rg"
  location = "West us"
}

resource "azurerm_storage_account" "mymoneygodam" {
  name                     = "maalgodam"
  resource_group_name      = azurerm_resource_group.mytestrg.name
  location                 = azurerm_resource_group.mytestrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "maaldacontainer" {
  name                  = "containetmaalda"
  storage_account_id    = azurerm_storage_account.mymoneygodam.id
  container_access_type = "private"
}