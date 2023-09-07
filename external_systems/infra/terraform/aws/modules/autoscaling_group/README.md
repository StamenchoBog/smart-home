# Autoscaling group module

The module `autoscaling_group` creates a autoscaling group used by ASG to deploy new resources with the provided variables.

## Module logic and accepted variables

The module accepts couple of variables and creates `autoscaling_group` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

### Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_cooldown"></a> [default\_cooldown](#input\_default\_cooldown) | n/a | `number` | `null` | no |
| <a name="input_default_instance_warmup"></a> [default\_instance\_warmup](#input\_default\_instance\_warmup) | n/a | `number` | `null` | no |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | n/a | `number` | `null` | no |
| <a name="input_force_delete"></a> [force\_delete](#input\_force\_delete) | n/a | `bool` | `null` | no |
| <a name="input_health_check_grace_period"></a> [health\_check\_grace\_period](#input\_health\_check\_grace\_period) | n/a | `number` | `null` | no |
| <a name="input_health_check_type"></a> [health\_check\_type](#input\_health\_check\_type) | n/a | `string` | `null` | no |
| <a name="input_instance_refresh"></a> [instance\_refresh](#input\_instance\_refresh) | n/a | <pre>object({<br>    strategy = string<br>    preferences = optional(object({<br>      checkpoint_delay       = optional(number)<br>      checkpoint_percentages = optional(list(number))<br>      instance_warmup        = optional(number)<br>      min_healthy_percentage = optional(number)<br>      skip_matching          = optional(bool)<br>    }))<br>    triggers = optional(set(string))<br>  })</pre> | `null` | no |
| <a name="input_launch_template"></a> [launch\_template](#input\_launch\_template) | n/a | <pre>object({<br>    id      = string<br>    version = string<br>  })</pre> | `null` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | n/a | `number` | n/a | yes |
| <a name="input_min_elb_capacity"></a> [min\_elb\_capacity](#input\_min\_elb\_capacity) | n/a | `number` | `null` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | n/a | `number` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `null` | no |
| <a name="input_placement_group_id"></a> [placement\_group\_id](#input\_placement\_group\_id) | n/a | `string` | `null` | no |
| <a name="input_protect_from_scale_in"></a> [protect\_from\_scale\_in](#input\_protect\_from\_scale\_in) | n/a | `bool` | `null` | no |
| <a name="input_service_linked_role_arn"></a> [service\_linked\_role\_arn](#input\_service\_linked\_role\_arn) | n/a | `string` | `null` | no |
| <a name="input_suspended_processes"></a> [suspended\_processes](#input\_suspended\_processes) | n/a | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | <pre>list(object({<br>    key                 = string<br>    value               = string<br>    propagate_at_launch = bool<br>  }))</pre> | `[]` | no |
| <a name="input_target_group_arns"></a> [target\_group\_arns](#input\_target\_group\_arns) | n/a | `list(string)` | `[]` | no |
| <a name="input_termination_policies"></a> [termination\_policies](#input\_termination\_policies) | n/a | `list(string)` | `[]` | no |
| <a name="input_vpc_zone_identifier"></a> [vpc\_zone\_identifier](#input\_vpc\_zone\_identifier) | n/a | `list(string)` | `null` | no |
| <a name="input_wait_for_capacity_timeout"></a> [wait\_for\_capacity\_timeout](#input\_wait\_for\_capacity\_timeout) | n/a | `string` | `null` | no |
| <a name="input_wait_for_elb_capacity"></a> [wait\_for\_elb\_capacity](#input\_wait\_for\_elb\_capacity) | n/a | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN for this Auto Scaling Group. |
| <a name="output_id"></a> [id](#output\_id) | Auto Scaling Group id. |

## Usage

Example for `main.tf` file:

```terraform
module "autoscaling_group" {
  source = "../../../modules/autoscaling_group"

  prefix = var.all_vars.prefix
  environment = var.all_vars.environment

  # Use `vpc_zone_identifier` if you want to deploy in multiple AZs, and `availability_zones` if you want to deploy
  # in a single AZ.
  vpc_zone_identifier = module.vpc.public_subnets_id
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template = {
    id      = module.launch_template.aws_launch_template_id
    version = "$Latest"
  }
}
```
