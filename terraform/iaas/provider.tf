terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}