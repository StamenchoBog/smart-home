# EFS Access point module

The EFS access point module creates EFS access point from the given variables.

## Module logic and accepted variables

The module accepts couple of variables and creates EFS access point depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards.

### Resources

| Name | Type |
|------|------|
| [aws_efs_access_point.access_point](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_access_point) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_file_system_id"></a> [file\_system\_id](#input\_file\_system\_id) | n/a | `string` | n/a |   yes    |
| <a name="input_posix_user"></a> [posix\_user](#input\_posix\_user) | n/a | <pre>object({<br>    gid            = number<br>    secondary_gids = optional(set(number))<br>    uid            = number<br>  })</pre> | `null` |    no    |
| <a name="input_root_directory"></a> [root\_directory](#input\_root\_directory) | n/a | <pre>object({<br>    creation_info = optional(object({<br>      owner_gid = number<br>      owner_uid = number<br>      # permissions: format of an octal number representing the file's mode bits<br>      permissions = string<br>    }))<br>    path = optional(string)<br>  })</pre> | `null` |    no    |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `null` |   yes    |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_efs_access_point_arn"></a> [efs\_access\_point\_arn](#output\_efs\_access\_point\_arn) | ARN of the access point |
| <a name="output_efs_access_point_id"></a> [efs\_access\_point\_id](#output\_efs\_access\_point\_id) | ID of the access point |

## Usage

Example usage for `main.tf` file:

```terraform
module "efs_access_point" {
    source = "../../../modules/efs_access_point"

    file_system_id = module.efs.id
}
```
