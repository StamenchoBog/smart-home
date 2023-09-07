# Transit gateway VPC attachment module

Module which creates the transit gateway attachment for a VPC.

## Module logic and accepted variables

The module accepts two variables, prefix and enfironment.

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `prefix = <prefix>`. The type of the variable is `string`.
- `environment = test`. The type of the variable is `string`.

### Main file example

Example for `main.tf` file:

```terraform
module "tgw" {
  source = "../../modules/tgw"

  prefix      = var.prefix
  environment = var.environment
}
```

## Outputs

The module creates `tgw_arn` output.
