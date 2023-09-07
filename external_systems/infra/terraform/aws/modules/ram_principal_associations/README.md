# Resource Access Manager principal association module

Simple module which creates association between given resource share and principal (AccountID).

## Module logic and accepted variables

The module creates the association.

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `principal = 602735809338`. AccountID of the destination account which whom we want to share resources. The type of the variable is `string`.
- `resource_share_arn = arn:aws:ram:eu-central-1:602735809338:resource-share/1fee6da7-b6e4-46a7-9e0e-4395576333b5`. Resource share ARN. The type of the variable is `string`.

### Main file example

Example for `main.tf` file:

```terraform
module "principal_associations" {
  source = "../../modules/ram_principal_associations"

  principal          = var.principal
  resource_share_arn = var.resource_share_arn
```

## Outputs

The module creates the `principal_association` output.
