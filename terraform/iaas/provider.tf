terraform {
  required_version = ">= 1.1.0"

  backend "azurerm" {
    resource_group_name   = "rg-ncy_3"
    storage_account_name  = "tfstate1034"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}