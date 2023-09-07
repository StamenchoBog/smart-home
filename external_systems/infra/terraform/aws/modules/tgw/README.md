# Transit gateway module

Simple module which creates transit gateway.

## Module logic and accepted variables

The module accepts two variables, prefix and environment.

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `prefix = <application>`. The type of the variable is `string`.
- `environment = test`. The type of the variable is `string`.
- `tags = { Example = "example" }`. The type of the variable is `map(string)`.

### Main file example

Example for `main.tf` file:

```terraform
module "tgw" {
  source = "../../modules/tgw"

  prefix      = var.prefix
  environment = var.environment
  tags = {
    Example = "example"
  }
}
```

## Outputs

The module creates `tgw_arn` output.
