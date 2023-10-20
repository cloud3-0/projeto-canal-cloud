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
  subscription_id = "caa30e72-9633-45ce-bd6d-66d8300e4a6b"
  tenant_id       = "1a5b6d50-9253-413e-b103-fdf9df5fabf1" 
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
