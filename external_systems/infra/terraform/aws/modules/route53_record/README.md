# Route53 record module

The route53_recorm module is a simple module which creates DNS record in a given hosted zone.

## Module logic and accepted variables

The module expects 5 variables in order to create the requested record. Expected variables are: zone_id, name, type, ttl and records.

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `zone_id = Z01824392PCUJUX93QJAS`. ID of the hosted zone where we want to place our record. The type of the variable is `string`.
- `name = test`. The actual record (subdomain) that we want to create. The type of the variable is `string`.
- `type = A`. The type of the record (A, MX, CNAME, SPF, etc.). The type of the variable is `string`.
- `ttl = 300`. Time to live of the record. The type of the variable is `string`.
- `records = ["10.11.20.189"]`. The type of the variable is `list(string)`.

### Main file example

Example for `main.tf` file:

```terraform
module "record" {
  zone_id = var.zone_id
  name    = var.name
  type    = var.type
  ttl     = var.ttl

  records = var.records
}
```

## Outputs

This module doesn't create any outputs.
