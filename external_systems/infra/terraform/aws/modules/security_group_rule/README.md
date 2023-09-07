# Security group rule module

The security group rule module creates a security group rule from the given variables.

## Module logic and accepted variables

The module accepts couple of variables and creates security group rule depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `security_group_id = sg23-34049`. The type of the variable is `string`.
- `description = Security group rule represents...`. The type of the variable is `string`.
- `type = ingress/egress`. The type of the variable is `string`.
- `from_port = 22`. The type of the variable is `number`.
- `to_port = 22`. The type of the variable is `number`.
- `protocol = tcp`. The type of the variable is `string`.
- `cidr_blocks = ["10.0.0.0/24"...]`. The type of the variable is `list(string)`.
- `ipv6_cidr_blocks = ["2001:da0::/27"...]`. The type of the variable is `list(string)`.

### Main file example

Example for `main.tf` file:

```terraform
module "security_group_rule_for_ssh" {
  source = "../../../modules/security_group_rule"

  security_group_id = module.ec2_security_group.security_group_id

  description = "EC2 security group rule for SSH access"
  type        = "ingress"
  from_port   = 22
  to_port     = 0
  protocol    = "tcp"
}
```

## Outputs

The module outputs `security_group_rule_id` for future usage.

## Possible conflicts with other terraform resources

Terraform currently provides both a standalone Security Group Rule resource (one or many ingress or egress rules), and a Security Group resource with ingress and egress rules defined in-line. At this time you cannot use a Security Group with in-line rules in conjunction with any Security Group Rule resources. Doing so will cause a conflict of rule settings and will overwrite rules.
