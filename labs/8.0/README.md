https://learn.microsoft.com/en-us/azure/developer/terraform/create-k8s-cluster-with-tf-and-aks

# Create a service principal with required parameter
az ad sp create-for-rbac 

The output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. For more information, see https://aka.ms/azadsp-cli
{
  "appId": "513239a2-d330-42f6-a2d6-1d59a37a7335",
  "displayName": "azure-cli-2023-02-12-22-22-33",
  "password": "SSd8Q~Oy11LjnwibmZr.EvpB9tkhJUZ3Ie7DDaFE",
  "tenant": "6bdfaeb3-c962-41e7-9107-7a6b2715e402"
}