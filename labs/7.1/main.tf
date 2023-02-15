locals {
  vnet_name = "example-vnet"
}

resource "azurerm_resource_group" "lab" {
  name     = "lab-7-1"
  location = "eastus"
}
resource "azurerm_resource_group_template_deployment" "example" {
  name                = "example-deploy"
  resource_group_name = azurerm_resource_group.lab.name
  deployment_mode     = "Incremental"
  
  parameters_content = jsonencode({
    "vnetName" = {
      value = local.vnet_name
    }
  
  })
  template_content = <<TEMPLATE
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "vnetName": {
            "type": "string",
            "metadata": {
                "description": "Name of the VNET"
            }
        }
    },
    "variables": {},
    "resources": [
        {
            "type": "Microsoft.Network/virtualNetworks",
            "apiVersion": "2020-05-01",
            "name": "[parameters('vnetName')]",
            "location": "[resourceGroup().location]",
            "properties": {
                "addressSpace": {
                    "addressPrefixes": [
                        "10.0.0.0/16"
                    ]
                }
            }
        }
    ],
    "outputs": {
      "exampleOutput": {
        "type": "string",
        "value": "someoutput"
      }
    }
}
TEMPLATE

  // NOTE: whilst we show an inline template here, we recommend
  // sourcing this from a file for readability/editor support
}

output arm_example_output {
  value = jsondecode(azurerm_resource_group_template_deployment.example.output_content).exampleOutput.value
}
