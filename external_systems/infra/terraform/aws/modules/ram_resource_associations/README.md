# Resource Access Manager resource association module

This is a simple module which creates association between resources and resource shares.

## Module logic and accepted variables

The module creates logical link between the resources that are created and the previously created resource share.

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `resource_arn = arn:aws:ec2:eu-central-1:602735809338:subnet/subnet-09b505d36802fbb34`. ARN of the resource that need to be shared. The type of the variable is `string`.
- `resource_share_arn = arn:aws:ram:eu-central-1:602735809338:resource-share/1fee6da7-b6e4-46a7-9e0e-4395576333b5`. Resource share ARN. The type of the variable is `string`.

### Main file example

Example for `main.tf` file:

```terraform
module "resource_associations_private_subnets" {
  source = "../../modules/ram_resource_associations"

  resource_arn       = var.resource_arn
  resource_share_arn = var.resource_share_arn
}
```

## Outputs

The module creates the `resource_association` output.
