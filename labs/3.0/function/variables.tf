variable "resource_group_name" {
    type = string
}

variable "resource_group_location" {
    type = string
}

variable "sku_name" {
  type = string
  default = "P1v2"
}

variable "storage_account_reqplication_type" {
  type = string
  default = "LRS"
}