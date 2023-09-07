# Route53 hosted zone module

The hosted zone module creates a hosted zone for the given domain and outputs its ID.

## Module logic and accepted variables

The module accepts two variables, name (domain name) and environment.

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `environment = dev`. The type of the variable is `string`.
- `name = domain.com`. The type of the variable is `string`.

### Main file example

Example for `main.tf` file:

```terraform
module "hosted_zone" {
  source = "../../modules/route53_hosted_zone"

  name        = var.hosted_zone_name
  environment = var.environment
}
```

## Outputs

The output of this module is `hosted_zone_id`.
