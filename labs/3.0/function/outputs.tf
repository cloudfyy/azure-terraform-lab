output "hostname" {
    value = "${azurerm_windows_function_app.lab.default_hostname}"
}