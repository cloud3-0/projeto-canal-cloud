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
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet-projeto" {
  name                = "vnet-projeto"
  resource_group_name = azurerm_resource_group.rg_projeto.name
  location            = azurerm_resource_group.rg_projeto.location
  address_space       = ["10.0.0.0/16"]
}


