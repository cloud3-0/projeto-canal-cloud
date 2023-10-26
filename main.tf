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
  subscription_id = "1a5b6d50-9253-413e-b103-fdf9df5fabf1" 
  tenant_id       = "67096ccc-f018-4ecb-a0ff-caaa7bf467e2"
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


