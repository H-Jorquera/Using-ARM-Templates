# Example: Run New-AzResourceGroupDeployment with the -WhatIf flag to perform the what-if operation.

New-AzResourceGroupDeployment `
-Whatif `
-TemplateUri "https://raw.githubusercontent.com/Azure/azure-docs-json-samples/master/azure-resource-manager/what-if/what-if-after.json"

# Example: Warning Doing this in real life will remove anything you have in the cloud. 
New-AzResourceGroupDeployment `
-Mode Complete `
-Confirm `
-TemplateUri "https://raw.githubusercontent.com/Azure/azure-docs-json-samples/master/empty-template/azuredeploy.json"