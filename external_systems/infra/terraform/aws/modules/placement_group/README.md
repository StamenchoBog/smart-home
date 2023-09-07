# Placement group module

The module `placement_group` creates a placement group for ASG with the provided variables.

## Module logic and accepted variables

The module accepts couple of variables and creates `placement group` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `environment = dev`. The type of the variable is `string`.
- `name = placement_group_123`. The type of the variable is `string`.
- `strategy = cluster`. The type of the variable is `string`.
- `partition_count = 2`. The type of the variable is `number`.
- `spread_level = host`. The type of the variable is `string`.
- `tags = { "Cost" = "massam" }`. The type of the variable is `map(string)`.

### Main file example

Example for `main.tf` file:

```terraform
module "placement_group" {
    source = "../../modules/placement_group"

    prefix = var.all_vars.prefix
    environment = var.all_vars.environment

    strategy = "cluster"
    tags = {
      "Cost" = "<application>"
    }
}
```

## Outputs

The module outputs `aws_placement_group_id` for future usage.
