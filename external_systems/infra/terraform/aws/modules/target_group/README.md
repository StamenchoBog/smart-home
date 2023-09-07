# Target group module

The module `target_group` creates a target group used to route requests to one or more registered targets.

## Module logic and accepted variables

The module accepts couple of variables and creates `target_group` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `prefix = <prefix>`. The type of the variable is `string`.
- `environment = dev`. The type of the variable is `string`.
- `name = "tg_123"`. The type of the variable is `string`.
- `connection_termination = true`. The type of the variable is `bool`.
- `deregistration_delay = 30`. The type of the variable is `number`.
- Variable `health_check`. The type of the variable is `object({})`.
Example of code below:

```terraform
health_check = {
    enabled = true
    healthy_threshold = 3
    unhealthy_threshold = 3
}
```

- `lambda_multi_value_headers_enabled = false`. The type of the variable is `bool`.
- `load_balancing_algorithm_type = "round_robin"`. The type of the variable is `string`.
- `port = 80`. The type of the variable is `number`.
- `protocol = "tcp"`. The type of the variable is `string`.
- `preserve_client_ip = false`. The type of the variable is `bool`.
- `protocol_version = "HTTP2"`. The type of the variable is `string`.
- `protocol = "HTTP"`. The type of the variable is `string`.
- `proxy_protocol_v2 = false`. The type of the variable is `bool`.
- `slow_start = 0`. The type of the variable is `number`.
- Variable `stickiness`. The type of the variable is `object({})`.
Example of code below:

```terraform
stickiness = {
    enabled = true
    type = "source_ip"
}
```

- Variable `target_failover`. The type of the variable is `object({})`.
Example of code below:

```terraform
target_failover = {
    on_deregistration = "no_rebalance"
    on_unhealthy = "no_rebalance"
}
```

- `target_type = "instance"`. The type of the variable is `string`.
- `ip_address_type = "ipv4"`. The type of the variable is `string`.
- `vpc_id = "vpc_id_2334"`. The type of the variable is `string`.

- Variable `tags`. The type of the variable is `map(string)`.
Example of code below:

```terraform
tags = {
    Cost = "<application>"
}
```

### Main file example

Example for `main.tf` file:

```terraform
module "alb_tg" {
  source = "../../modules/target_group"

  prefix      = var.all_vars.prefix
  environment = var.all_vars.environment

  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}
```

## Outputs

The module outputs `lb_tg_arn` for future usage.
