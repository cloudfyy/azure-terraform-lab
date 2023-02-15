provider "azurerm" {
  features {}
}
provider "random" {
  //features {}
}


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.96.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 2.1"
    }
  }
}