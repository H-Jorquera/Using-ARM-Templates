# Deploy an ARM template to Azure

# 1. sign in to Azure by using the PowerShell Az Module
Connect-AzAccount

# 2. Define resource group for deployment.
New-AzResourceGroup `
  -Name {name of your resource group} `
  -Location "{location}"

# 3. Deploy a template
$templateFile = "{provide-the-path-to-the-template-file}"
New-AzResourceGroupDeployment `
  -Name blanktemplate `
  -ResourceGroupName myResourceGroup `
  -TemplateFile $templateFile

    # Example 1:
        $templateFile = "azuredeploy.json"
        $today=Get-Date -Format "MM-dd-yyyy"
        $deploymentName="addstorage-"+"$today"
        New-AzResourceGroupDeployment `
        -Name $deploymentName `
        -TemplateFile $templateFile

    # Example 2: Deploy a parameterized ARM template. Provide a unique name and required storage SKU.  -storageSKU Standard_GRS
    $templateFile = "parametized.Azuredeploy.json"
    $today=Get-Date -Format "yyyy-MM-dd"
    $deploymentName="addnameparameter-"+"$today"
    New-AzResourceGroupDeployment `
      -Name $deploymentName `
      -TemplateFile $templateFile `
      -storageName hjparametizedstorage2021
      -storageName {your-unique-name} `
      -storageSKU Standard_GRS

    # Example 3: Deploy a paramterized ARM template with a sparate Parameters file.
    $templateFile = "{path-to-the-template-file}"
    $parameterFile="{path-to-azuredeploy.parameters.dev.json}"
    New-AzResourceGroup `
      -Name myResourceGroupDev `
      -Location "East US"
    New-AzResourceGroupDeployment `
      -Name devenvironment `
      -ResourceGroupName myResourceGroupDev `
      -TemplateFile $templateFile `
      -TemplateParameterFile $parameterFile

      # Example 3.1:
      $templateFile = 'tags.azuredeploy.json'
      $parameterFile= 'params.tags.azuredeploy.parameters.json'
      #New-AzResourceGroup `
      #  -Name TagsResourceGroupDev `
      #  -Location "East US"
      New-AzResourceGroupDeployment `
        -Name tagsstoragedeployment02 `
      #  -ResourceGroupName TagsResourceGroupDev `
        -TemplateFile $templateFile `
        -TemplateParameterFile $parameterFile

        New-AzResourceGroupDeployment -Name tagsstoragedeployment02 -TemplateFile tags.azuredeploy.json -TemplateParameterFile params.tags.azuredeploy.parameters.json

# 4. Working with subscriptions
Connect-AzAccount
Get-AzSubscription

  # Change your active subscription to the Desired Subscription
        $context = Get-AzSubscription -SubscriptionId {Your subscription ID}
        Set-AzContext $context

    # If deploying to the same Resource group during entire session, set it as default. 
    # This action lets you omit that parameter from the rest of the Azure PowerShell commands in this session
        Set-AzDefault -ResourceGroupName azDeploy-RG

        $templateFile = "tags.azuredeploy.json"
        $today=Get-Date -Format "MM-dd-yyyy"
        $deploymentName="tagsstorage01-"+"$today"
        New-AzResourceGroupDeployment `
          -Name $deploymentName `
          -TemplateFile $templateFile `
          -storagePrefix tagsorage

          $templateFile = "azuredeploy.json"
          $today=Get-Date -Format "MM-dd-yyyy"
          $deploymentName="updateTags-"+"$today"
          New-AzResourceGroupDeployment `
            -Name $deploymentName `
            -TemplateFile $templateFile `
            -storagePrefix lisfranc `
            -storageSKU Standard_LRS