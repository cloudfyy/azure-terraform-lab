

resource "azurerm_resource_group" "lab" {
  name     = "lab-1-3"
  location = "northeurope"
}

resource "random_id" "lab" {
  keepers = {
    resource_group = "${azurerm_resource_group.lab.name}"
  }

  byte_length = 2
}

resource "azurerm_service_plan" "lab" {
  name                = "lab-plan"
  location            = "${azurerm_resource_group.lab.location}"
  resource_group_name = "${azurerm_resource_group.lab.name}"
  //kind                = "FunctionApp"

  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_storage_account" "lab" {
  name                     = "lab${random_id.lab.dec}store"
  resource_group_name      = "${azurerm_resource_group.lab.name}"
  location                 = "${azurerm_resource_group.lab.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_windows_function_app" "lab" {
  name                      = "lab${random_id.lab.dec}demo"
  //name                      = "lab${random_id.lab.dec}"
  location                  = "${azurerm_resource_group.lab.location}"
  resource_group_name       = "${azurerm_resource_group.lab.name}"
  service_plan_id           = "${azurerm_service_plan.lab.id}"
  storage_account_name      = azurerm_storage_account.lab.name
  storage_account_access_key= azurerm_storage_account.lab.primary_access_key

  site_config {}

  app_settings = {
      ABC = "XYZ"
  }
}