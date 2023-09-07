# EC2 instance module

The EC2 instance module creates instance from the given variables.

## Module logic and accepted variables

The module accepts couple of variables and creates instance depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards.

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `environment = test`. The type of the variable is `string`.
- `ami = ami-123456`. The type of the variable is `string`.
- `instance_type = t3.micro`. The type of the variable is `string`.
- `key_name = test-key`. The type of the variable is `string`.
- `instance_profile_name = instance-profile`. The type of the variable is `string`.
- `metadata_options = { http_endpoint = 'enabled' http_tokens = 'required' }`. The type of the variable is `object()` that has the two variables.
- `enable_ebs_optimized = true`. The type of variable is `bool`.
- `enable_root_block_device_encryption = true`. The type of variable is `bool`.
- `enable_instance_monitoring = true`. The type of variable is `bool`.
- `subnet_id = subnet-abc123`. The type of the variable is `string`.
- `ec2_security_groups_ids = [sg-abcdef123456]`. The type of the variable is `list(string)`.
- `user_data = "#!/bin/bash\nwhoami >user.txt"`. The type of the variable is `string`.

### Main file example

Example for `main.tf` file:

```terraform
module "private_instance" {
  source = "../../modules/ec2"
  environment = var.all_vars.environment

  ami                                 = var.all_vars.ami
  instance_type                       = var.all_vars.instance_type
  metadata_http_endpoint              = var.all_vars.metadata_http_endpoint
  metadata_http_tokens                = var.all_vars.metadata_http_tokens
  enable_ebs_optimized                = var.all_vars.enable_ebs_optimized
  enable_root_block_device_encryption = var.all_vars.enable_root_block_device_encryption
  enable_instance_monitoring          = var.all_vars.enable_instance_monitoring
  key_name                            = module.key_pair.key_name
  instance_profile_name               = module.instance_iam.instance_profile_name

  subnet_id             = element(module.vpc.private_subnets_id, 1)
  ec2_security_groups_ids = [module.ec2_security_group.security_group_id]
}
```

## Outputs

The module creates outputs `public_ip` and `private_ip` for future usage.
