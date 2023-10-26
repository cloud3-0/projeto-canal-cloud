# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "3ec358c5-ecbe-411f-94e6-bea82052d9c0"  
}

# Create a resource group
resource "azurerm_resource_group" "rg_projeto" {
  name     = "rg_projeto"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet-projeto" {
  name                = "vnet-projeto"
  resource_group_name = azurerm_resource_group.rg_projeto.name
  location            = azurerm_resource_group.rg_projeto.location
  address_space       = ["10.0.0.0/16"]
}
