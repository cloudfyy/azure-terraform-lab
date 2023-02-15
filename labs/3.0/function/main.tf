
resource "random_id" "lab" {
  keepers = {
    resource_group  = "${var.resource_group_name}"
  }

  byte_length = 2
}

resource "azurerm_service_plan" "lab" {
  name                = "lab-plan"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.resource_group_location}"

  //kind = "FunctionApp"

  os_type             = "Windows"
  sku_name            = "${var.sku_name}"
}

resource "azurerm_storage_account" "lab" {
  name                     = "lab${random_id.lab.dec}store"
  resource_group_name      = "${var.resource_group_name}"
  location                 = "${var.resource_group_location}"
  account_tier             = "Standard"
  account_replication_type = "${var.storage_account_reqplication_type}"
}

resource "azurerm_windows_function_app" "lab" {
  name                      = "lab${random_id.lab.dec}"
  resource_group_name       = "${var.resource_group_name}"
  location                  = "${var.resource_group_location}"
  service_plan_id           = "${azurerm_service_plan.lab.id}"
  storage_account_name      = azurerm_storage_account.lab.name
  storage_account_access_key= azurerm_storage_account.lab.primary_access_key

  site_config {}

  app_settings = {
      //ABC = "XYZ"
  }
}