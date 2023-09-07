# Launch template module

The module `launch_template` creates a launch template used by ASG to deploy new resources with the provided variables.

## Module logic and accepted variables

The module accepts couple of variables and creates `launch template` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

### Resources

| Name | Type |
|------|------|
| [aws_launch_template.asg_lt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_block_device_mappings"></a> [block\_device\_mappings](#input\_block\_device\_mappings) | n/a | <pre>object({<br>    device_name = string<br>    ebs = object({<br>      volume_size           = optional(number)<br>      encrypted             = optional(bool)<br>      delete_on_termination = optional(bool)<br>      snapshot_id           = optional(string)<br>      volume_type           = optional(string)<br>    })<br>  })</pre> | `null` | no |
| <a name="input_capacity_reservation_specification"></a> [capacity\_reservation\_specification](#input\_capacity\_reservation\_specification) | n/a | <pre>object({<br>    capacity_reservation_preference = optional(string)<br>    capacity_reservation_target = optional(object({<br>      capacity_reservation_id                 = string<br>      capacity_reservation_resource_group_arn = string<br>    }))<br>  })</pre> | `null` | no |
| <a name="input_cpu_options"></a> [cpu\_options](#input\_cpu\_options) | n/a | <pre>object({<br>    core_count       = number<br>    threads_per_core = number<br>  })</pre> | `null` | no |
| <a name="input_default_version"></a> [default\_version](#input\_default\_version) | n/a | `number` | `null` | no |
| <a name="input_disable_api_stop"></a> [disable\_api\_stop](#input\_disable\_api\_stop) | n/a | `bool` | `null` | no |
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | n/a | `bool` | `null` | no |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | n/a | `bool` | `null` | no |
| <a name="input_elastic_gpu_specifications"></a> [elastic\_gpu\_specifications](#input\_elastic\_gpu\_specifications) | n/a | <pre>object({<br>    type = string<br>  })</pre> | `null` | no |
| <a name="input_elastic_inference_accelerator"></a> [elastic\_inference\_accelerator](#input\_elastic\_inference\_accelerator) | n/a | <pre>object({<br>    type = string<br>  })</pre> | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | n/a | <pre>object({<br>    arn  = optional(string)<br>    name = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | n/a | `string` | `null` | no |
| <a name="input_instance_initiated_shutdown_behavior"></a> [instance\_initiated\_shutdown\_behavior](#input\_instance\_initiated\_shutdown\_behavior) | n/a | `string` | `null` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `null` | no |
| <a name="input_kernel_id"></a> [kernel\_id](#input\_kernel\_id) | n/a | `string` | `null` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | `null` | no |
| <a name="input_license_specifications"></a> [license\_specifications](#input\_license\_specifications) | n/a | <pre>list(object({<br>    license_configuration_arn = string<br>  }))</pre> | `[]` | no |
| <a name="input_maintenance_options"></a> [maintenance\_options](#input\_maintenance\_options) | n/a | <pre>object({<br>    auto_recovery = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_metadata_options"></a> [metadata\_options](#input\_metadata\_options) | n/a | <pre>object({<br>    http_endpoint               = optional(string)<br>    http_tokens                 = optional(string)<br>    http_put_response_hop_limit = optional(number)<br>    http_protocol_ipv6          = optional(string)<br>    instance_metadata_tags      = optional(string)<br>  })</pre> | <pre>{<br>  "http_endpoint": "enabled",<br>  "http_tokens": "required"<br>}</pre> | no |
| <a name="input_monitoring"></a> [monitoring](#input\_monitoring) | n/a | <pre>object({<br>    enabled = optional(bool)<br>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Optional if you want to override generated name with prefix and environment | `string` | `null` | no |
| <a name="input_placement"></a> [placement](#input\_placement) | n/a | <pre>object({<br>    group_name              = optional(string)<br>    availability_zone       = optional(string)<br>    host_id                 = optional(string)<br>    host_resource_group_arn = optional(string)<br>    affinity                = optional(string)<br>    tenancy                 = string<br>    partition_number        = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_ram_disk_id"></a> [ram\_disk\_id](#input\_ram\_disk\_id) | n/a | `string` | `null` | no |
| <a name="input_tag_specifications"></a> [tag\_specifications](#input\_tag\_specifications) | n/a | <pre>list(object({<br>    resource_type = string<br>    tags          = map(string)<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_update_default_version"></a> [update\_default\_version](#input\_update\_default\_version) | n/a | `bool` | `null` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | n/a | `string` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | n/a | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_launch_template_arn"></a> [aws\_launch\_template\_arn](#output\_aws\_launch\_template\_arn) | Amazon Resource Name (ARN) of the launch template. |
| <a name="output_aws_launch_template_id"></a> [aws\_launch\_template\_id](#output\_aws\_launch\_template\_id) | The ID of the launch template. |
| <a name="output_latest_version"></a> [latest\_version](#output\_latest\_version) | The latest version of the launch template. |

### Usage

Example for `main.tf` file:

```terraform
module "launch_template" {
  source = "../../modules/launch_template"

  environment = var.all_vars.environment

  image_id = data.aws_ami_ids.amzn2_ebs.id
  block_device_mappings = {
    device_name = "/dev/xvda"
    ebs = {
      volume_size           = 20
      encrypted             = true
      delete_on_termination = true
    }
  }

  update_default_version = true

  tags = {
    "Cost" = "<application>"
  }
}
```
