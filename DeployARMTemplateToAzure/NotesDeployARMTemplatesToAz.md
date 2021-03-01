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

For details, see [Define resources in Azure Resource Manager templates.] (<https://docs.microsoft.com/en-us/azure/templates/>)

## Expressions

Expressions are values that are evaluated when an ARM template is deployed.

- Expressions start with brackets []
- Expressions can return
  - a String
  - a Boolean
  - an Array
  - an Object

### Expression example

Below, the expression is the value of the `defaultValue:` attribute. The expression holds the ARM template function `resourceGroup()`
The `location` retrieves the property location fro the object returned byt he function `resourceGroup()`

```json
        "parameters": {
          "location": {
            "type": "string",
            "defaultValue": "[resourceGroup().location]"
          }
        },
```

## Working with ARM template functions

### Rules

1. Use single quotations when feeding a string value into a function.
    1. To feed the string 'storage' into the function `concat`.
    1. Use the following: `concat('storage',uniqueString(resourceGroup().id))`.

1. _Escape characters_ are used to work with literal values in template functions. 

1. To set a property null, use `null` or [json('null)]
