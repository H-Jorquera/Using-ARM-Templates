# Notes

## For complex solutions
Use linked templates to deploy complex solutions. 
You can break a template into many templates and deploy these templates through a main template.

## Add resources to a template

1. For this you need to know the [resource provider](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/azure-services-resource-providers) 
and its types of resources.

    ```json
      {resource-provider}/{resource-type}
        i.e.: To add a Storage account:
        Microsoft.Storage/storageAccounts
    ```

1. You need to understand the properties for each resource type you want to use.

For details, see [Define resources in Azure Resource Manager templates.] (https://docs.microsoft.com/en-us/azure/templates/)
