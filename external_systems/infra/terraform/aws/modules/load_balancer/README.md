# Load balancer module

The module `load_balancer` creates a load balancer used to create a application/network load balancer distributing incoming network traffic across a group of backend servers.

## Module logic and accepted variables

The module accepts couple of variables and creates `load_balancer` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `environment = dev`. The type of the variable is `string`.
- `name = "lb_123"`. The type of the variable is `string`.
- `internal = true`. The type of the variable is `bool`.
- `load_balancer_type = application`. The type of the variable is `string`.
- `security_groups = ["sg_id_123"]`. The type of the variable is `list(string)`.
- `drop_invalid_header_fields = false`. The type of the variable is `bool`.
- `preserve_host_header = false`. The type of the variable is `bool`.
- Variable `access_logs`. The type of the variable is `object({})`.
Example of code below:

```terraform
access_logs = {
    bucket = "bucket_name_for_logs"
    prefix = "alb_logs"
    enabled = true
}
```

- `subnets = ["public_sub_1", "public_sub_2"]`. The type of the variable is `list(string)`.
- Variable `subnet_mappings`. The type of the variable is `list(object({}))`.
Example of code below:

```terraform
subnet_mappings = [
    {
        subnet_id     = aws_subnet.example1.id
        allocation_id = aws_eip.example1.id
    },
    {
        subnet_id     = aws_subnet.example2.id
        allocation_id = aws_eip.example2.id
    }
]
```

- `idle_timeout = 60`. The type of the variable is `number`.
- `enable_deletion_protection = false`. The type of the variable is `bool`.
- `enable_cross_zone_load_balancing = false`. The type of the variable is `bool`.
- `enable_http2 = true`. The type of the variable is `bool`.
- `enable_waf_fail_open = false`. The type of the variable is `bool`.
- `customer_owned_ipv4_pool = "customer_owned_pool_id"`. The type of the variable is `string`.
- `ip_address_type = "ipv4"`. The type of the variable is `string`.
- `desync_mitigation_mode = "defensive"`. The type of the variable is `string`.

- Variable `tags`. The type of the variable is `object({})`.
Example of code below:

```terraform
tags = {
    Cost = "<application>"
}
```

### Main file example

Example for `main.tf` file:

```terraform
module "alb" {
  source = "../../../modules/load_balancer"
  environment = var.all_vars.environment

  internal           = false
  load_balancer_type = "application"
  subnets            = module.vpc.public_subnets_id

  enable_deletion_protection = false

  tags = {
    Environment = var.all_vars.environment
  }
}
```

## Outputs

The module outputs `lb_id` and `lb_arn` for future usage.
