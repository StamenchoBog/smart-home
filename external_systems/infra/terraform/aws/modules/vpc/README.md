# VPC module

The VPC module creates vpc, private and public sunets, internet and nat gateway, elastic IP and route tables.

## Module logic and accepted variables

The module accepts list of strings of private/public variables. It counts the length of the subnet CIDR variable and according to that it creates that many subnets. Components which are created with this module:

- VPC
- Private subnets
- Public subnets
- Elastic IP
- Route tables
- NAT gateway
- Internet gateway

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `prefix = smart-home`. The type of the variable is `string`.
- `environment = test`. The type of the variable is `string`.
- `region = eu-central-1`. The type of the variable is `string`.
- `availability_zones   = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]`. The type of the variable is `list(string)`.
- `vpc_cidr = 10.10.0.0/16`. The type of the variable is `string`.
- `public_subnets_cidr = [10.10.101.0/24, 10.10.102.0/24, 10.10.103.0/24]`. The type of the variable is `list(string)`.
- `private_subnets_cidr = [10.10.1.0/24, 10.10.2.0/24, 10.10.3.0/24]`. The type of the variable is `list(string)`.

### Main file example

Example for `main.tf` file:

```terraform
module "vpc" {
  source = "../../modules/vpc"
  count  = length(var.all_vars)

  #values from variable all_vars objects
  prefix               = var.prefix
  region               = var.region
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  availability_zones   = var.availability_zones
}
```

## Outputs

The module creates the following output values for further usage: `vpc_id`, `private_subnets_id`, `public_subnets_id`, `public_subnets_arns`, `private_subnets_arns`, `public_route_table`.