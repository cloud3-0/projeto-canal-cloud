terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.74.0"
    }
  }

}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}   
}

# Create a resource group
resource "azurerm_resource_group" "rg_projeto" {
  name     = "rg_projeto"
  location = "East US"
}

resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate"
  location = "East US"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstate${random_string.resource_code.result}"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = false

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet-projeto" {
  name                = "vnet-projeto"
  resource_group_name = azurerm_resource_group.rg_projeto.name
  location            = azurerm_resource_group.rg_projeto.location
  address_space       = ["10.0.0.0/16"]
}