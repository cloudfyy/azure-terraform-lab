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

  required_version = "~> 1.3.0"
}