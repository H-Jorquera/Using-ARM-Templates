# Deploy an ARM template to Azure

# 1. sign in to Azure by using the PowerShell Az Module
Connect-AzAccount

# 2. Define resource group for deployment.
New-AzResourceGroup `
  -Name {name of your resource group} `
  -Location "{location}"

# 3. Deploy the template
$templateFile = "{provide-the-path-to-the-template-file}"
New-AzResourceGroupDeployment `
  -Name blanktemplate `
  -ResourceGroupName myResourceGroup `
  -TemplateFile $templateFile