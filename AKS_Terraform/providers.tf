terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=4.58.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "tfstate-rg"
    storage_account_name = "tfstate012726"
    container_name = "tfstatecontainer"
    key = "aks.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}