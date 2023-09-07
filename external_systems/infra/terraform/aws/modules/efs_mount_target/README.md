# EFS Mount target module

The EFS mount target module creates EFS mount target from the given variables.

## Module logic and accepted variables

The module accepts couple of variables and creates EFS mount target depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards.

### Resources

| Name | Type |
|------|------|
| [aws_efs_mount_target.efs_mount_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_file_system_id"></a> [file\_system\_id](#input\_file\_system\_id) | n/a | `string` | n/a | yes |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | n/a | `string` | `null` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | n/a | `list(string)` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the mount target. |
| <a name="output_mount_target_dns_name"></a> [mount\_target\_dns\_name](#output\_mount\_target\_dns\_name) | The DNS name for the given subnet/AZ per documented convention. |

## Usage

Example usage for `main.tf` file:

```terraform
module "efs_mount_target" {
    source = "../../modules/efs_mount_target"

    file_system_id = aws_efs_file_system.foo.id
    subnet_id      = aws_subnet.alpha.id
}
```
