# Deploy ARM Template at the resource group 
# NOTE: we aren't passing the name of the resource group as this has ben set as
# default earlier: Set-AzDefault -ResourceGroupName {Resource Group Name}


$templateFile="C:\code\Using-ARM-Templates\DeployARMtemplates\maintemplate.json"
$today=Get-Date -Format "MM-dd-yyyy"
$DeploymentName="DeployLocalTemplate-"+"$today"

New-AzResourceGroupDeployment `
-Name $DeploymentName `
-TemplateFile $templateFile

# Deploy ARM Template at the resource group with inline parameters

$parameters = @{vnetName = "VNet-001"; costCenterIO = "12345"; ownerName = "John Smith"}
$templateFile="C:\code\Using-ARM-Templates\DeployARMtemplates\maintemplate.json"
$today=Get-Date -Format "MM-dd-yyyy"
$DeploymentName="DeployLocalTemplate-2-"+"$today"

New-AzResourceGroupDeployment `
    -Name $DeploymentName `
    -TemplateFile $templateFile `
    -TemplateParameterObject $parameters


# Deploy ARM Template at the resource group with Template Parameter File

$templateFile="C:\code\Using-ARM-Templates\DeployARMtemplates\maintemplate.json"
$TemplateParameterFile= "C:\code\Using-ARM-Templates\DeployARMtemplates\maintemplate.parameters.json"
$today=Get-Date -Format "MM-dd-yyyy"
$DeploymentName="DeployLocalTemplate-3-"+"$today"

New-AzResourceGroupDeployment `
    -Name $DeploymentName `
    -TemplateFile $templateFile `
    -TemplateParameterFile $TemplateParameterFile

#  Deploy an external or remote template

$parameters = @{vnetName = "VNet-001"; costCenterIO = "12345"; ownerName = "John Smith"}
$today=Get-Date -Format "MM-dd-yyyy"
$DeploymentName="DeployLocalTemplate-4-"+"$today"

New-AzResourceGroupDeployment `
    -Name $DeploymentName `
    -TemplateUri https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-storage-account-create/azuredeploy.json