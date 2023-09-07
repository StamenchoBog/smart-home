# Load balancer listener rule module

The module `load_balancer_listener_rule` creates a load balancer listener rule that will be added to the provided load balancer listener.

## Module logic and accepted variables

The module accepts couple of variables and creates `load_balancer_listener_rule` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `listener_arn = "arn_21234"`. The type of the variable is `string`.
- `priority = 1`. The type of the variable is `number`.

- Variable `actions`. The type of the variable is `set(object({}))`.
Example of code below:

```terraform
actions = [
    {
        type             = "forward"
        target_group_arn = aws_lb_target_group.static.arn
    }
]
```

- Variable `conditions`. The type of the variable is `set(object({}))`.
Example of code below:

```terraform
conditions = [
    {
        host_header = {
            values = ["my-service.*.terraform.io"]
        }
    }
]
```

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
module "alb_listener_additional_rule" {
  source = "../../modules/load_balancer_listener_rule"

  listener_arn = module.alb_listener.lb_listener_arn
  priority     = 100

  actions = [
    {
      type             = "forward"
      target_group_arn = module.alb_tg.lb_tg_arn
    }
  ]

  conditions = [
    {
      path_pattern = {
        values = ["/static/*"]
      }
    }
  ]
}
```

## Outputs

No outputs from this module at the moment.
