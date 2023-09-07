# Security Group module

The sg (security group) module is a simple module which creates a single security group with rules defined from the variables. 

## Module logic and accepted variables

The module takes advantage of dynamic blocks so we can create multiple rules based on the input variables. 

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `prefix = smart-home`. The type of the variable is `string`.
- `name = security-group`. The type of the variable is `string`.
- `vpc_id = vpc-abcdef`. The type of the variable is `string`.
- `ingress_rules = [{ description = "HTTPS inbound traffic" from_port = 443 to_port = 443 protocol = "tcp" cidr = ["0.0.0.0/0"]}]`. The type of the variable is `list(object(any))`.
- `egress_rules = [{ description = "HTTPS outbound traffic" from_port = 443 to_port = 443 protocol = "tcp" cidr = ["0.0.0.0/0"]}]`. The type of the variable is `list(object(any))`.

### Main file example

Example for `main.tf` file:

```terraform
module "ec2_security_group" {
  source        = "../../modules/security_group"
  prefix        = var.prefix
  environment   = var.environment
  name          = var.security_groups.name
  ingress_rules = var.security_groups.ingress_rules
  egress_rules  = var.security_groups.egress_rules
}
```

## Outputs

The module creates outputs the `ec2_security_group_id` value for further usage.
