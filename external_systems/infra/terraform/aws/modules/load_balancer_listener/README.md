# Load balancer listener module

The module `load_balancer_listener` creates a load balancer listener that will be added to the provided load balancer.

## Module logic and accepted variables

The module accepts couple of variables and creates `load_balancer_listener` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

### Resources

| Name | Type |
|------|------|
| [aws_lb_listener.lb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |


### Variables

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alpn_policy"></a> [alpn\_policy](#input\_alpn\_policy) | n/a | `string` | `null` |    no    |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | n/a | `string` | `null` |    no    |
| <a name="input_default_actions"></a> [default\_actions](#input\_default\_actions) | n/a | <pre>set(object({<br>    type             = string<br>    order            = optional(number)<br>    target_group_arn = optional(string)<br><br>    # Blocks<br>    fixed_response = optional(object({<br>      content_type = string<br>      message_body = optional(string)<br>      status_code  = optional(number)<br>    }))<br>    forward = optional(object({<br>      target_groups = set(object({<br>        arn    = string<br>        weight = optional(number)<br>      }))<br>      stickiness = optional(object({<br>        duration = number<br>        enabled  = optional(bool)<br>      }))<br>    }))<br>    redirect = optional(object({<br>      status_code = string<br>      host        = optional(string)<br>      path        = optional(string)<br>      port        = optional(string)<br>      protocol    = optional(string)<br>      query       = optional(string)<br>    }))<br>  }))</pre> | n/a |   yes    |
| <a name="input_load_balancer_arn"></a> [load\_balancer\_arn](#input\_load\_balancer\_arn) | n/a | `string` | n/a |   yes    |
| <a name="input_port"></a> [port](#input\_port) | n/a | `number` | `null` |    no    |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | n/a | `string` | `null` |    no    |
| <a name="input_ssl_policy"></a> [ssl\_policy](#input\_ssl\_policy) | n/a | `string` | `null` |    no    |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `null` |   yes    |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_listener_arn"></a> [lb\_listener\_arn](#output\_lb\_listener\_arn) | ARN of the listener (matches id). |


## Usage

Example for `main.tf` file:

```terraform
module "alb_listener" {
  source = "../../../modules/load_balancer_listener"

  load_balancer_arn = module.alb.lb_arn

  port            = "443"
  protocol        = "HTTPS"
  ssl_policy      = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_actions = [
    {
      type             = "forward"
      target_group_arn = module.alb_tg.lb_tg_arn
    }
  ]
}
```
