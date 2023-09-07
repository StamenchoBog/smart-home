# IAM user module

The module `iam_user` creates and provides an IAM user.

## Module logic and accepted variables

The module accepts couple of variables and creates `IAM user` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

### Resources

| Name | Type |
|------|------|
| [aws_iam_user.iam_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | n/a | `bool` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | n/a | `string` | `null` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | n/a | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN assigned by AWS for this user. |
| <a name="output_name"></a> [name](#output\_name) | The user's name. |

### Usage

Example for `main.tf` file:

```terraform
module "packer_iam_user" {
  source = "../../modules/iam_user"
  name = var.packer_vars.iam_user.name
  path = var.packer_vars.iam_user.path
  tags = var.packer_vars.iam_user.tags
}
```
