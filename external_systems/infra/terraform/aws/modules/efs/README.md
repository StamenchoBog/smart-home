# EFS module

The EFS module creates elastic file system from the given variables.

## Module logic and accepted variables

The module accepts couple of variables and creates EFS file system depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards.

### Resources

| Name | Type |
|------|------|
| [aws_efs_file_system.efs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone_name"></a> [availability\_zone\_name](#input\_availability\_zone\_name) | n/a | `string` | `null` |    no    |
| <a name="input_creation_token"></a> [creation\_token](#input\_creation\_token) | A unique name (a maximum of 64 characters are allowed) used as reference when creating the Elastic File System to ensure idempotent file system creation. | `string` | `null` |    no    |
| <a name="input_enable_encryption"></a> [enable\_encryption](#input\_enable\_encryption) | n/a | `bool` | `null` |    no    |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | n/a | `string` | `null` |    no    |
| <a name="input_lifecycle_policy"></a> [lifecycle\_policy](#input\_lifecycle\_policy) | n/a | <pre>object({<br>    transition_to_ia                    = optional(string)<br>    transition_to_primary_storage_class = optional(string)<br>  })</pre> | `null` |    no    |
| <a name="input_performance_mode"></a> [performance\_mode](#input\_performance\_mode) | n/a | `string` | `null` |    no    |
| <a name="input_provisioned_throughput_in_mibps"></a> [provisioned\_throughput\_in\_mibps](#input\_provisioned\_throughput\_in\_mibps) | n/a | `number` | `null` |    no    |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `null` |   yes    |
| <a name="input_throughput_mode"></a> [throughput\_mode](#input\_throughput\_mode) | n/a | `string` | `null` |    no    |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name of the file system |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | The DNS name for the filesystem |
| <a name="output_id"></a> [id](#output\_id) | The ID that identifies the file system (e.g., fs-ccfc0d65). |

## Usage

Example usage for `main.tf` file:

```terraform
module "efs_file_system" {
    source = "../../../modules/efs"

    creation_token = "my-efs"

    tags = {
        Name = "MyEFS"
    }
}
```
