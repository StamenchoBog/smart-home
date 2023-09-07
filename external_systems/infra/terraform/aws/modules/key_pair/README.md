# EC2 key pair module

This module creates key pair on AWS for connecting to instances.

## Module logic and accepted variables

The key-pair module creates ssh key pair which can be attached to instances. Additionally, it creates a parameter in Parameter Store with the private component of the key.

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `key_name = key123`. Key name. The type of the variable is `string`.

### Main file example

Example for `main.tf` file:

```terraform
module "key_pair" {
  source = "../../modules/key_pair"

  key_name = var.key_name
}
```

## Outputs

The module creates the `key_name` output.
