
provider "azapi" {
  default_location = "eastus"
  default_tags = {
    team = "Azure deployments"
  }
}

provider "azurerm" {
  features {}
}