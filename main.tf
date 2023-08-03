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
  features {
    #skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  }
}

# Create a resource group
resource "azurerm_resource_group" "Terralabs" {
  name     = "Terralabs-rg"
  location = "West Europe"
}

#this is the new changes
# Create a virtual network within the resource group
resource "azurerm_virtual_network" "Terralabs" {
  name                = "v-net"
  resource_group_name = azurerm_resource_group.Terralabs.name
  location            = azurerm_resource_group.Terralabs.location
  address_space       = ["10.0.0.0/16"]
}