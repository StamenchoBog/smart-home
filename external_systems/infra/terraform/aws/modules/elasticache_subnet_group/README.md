# ElastiCache subnet group module

The module `elasticache_subnet_group` provides an ElastiCache Subnet Group resource.

## Module logic and accepted variables

The module accepts couple of variables and creates `elasticache_subnet_group` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

### Resources

| Name | Type |
|------|------|
| [aws_elasticache_subnet_group.elasticache_sb_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | n/a | `set(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The Name of the ElastiCache Subnet Group. |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | The Subnet IDs of the ElastiCache Subnet Group. |

## Usage

Example for `main.tf` file:

```terraform
module "elasticache_subnet_group" {
  source = "../../modules/elasticache_subnet_group"
  name       = "tf-test-cache-subnet"
  subnet_ids = [aws_subnet.foo.id]
}
```
