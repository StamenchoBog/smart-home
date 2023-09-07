# IAM module

The IAM module creates multiple resources needed for attaching a role to an EC2 instance.

## Module logic and accepted variables

The module expects `role_name`, `assume_role_principal_type`, `assume_role_principal_identifiers` as variables which are required and creates the following resources:

- `aws_iam_policy_document`
- `aws_instance_role`
- `aws_iam_instance_profile`

The variables `role_policies` and `managed_policy_arns` are optional. Variable `role_policies` is used to create a list of policies while `managed_policy_arns` is to specify a list of already AWS created and managed policies.

## Example

### Variables example

In the `variables.tf` file we can specify values as follows. Please keep in mind that these values are just an example, you can specify values according to your needs:

- `role_name = ec2-role`. Name for the role. The type of the variable is `string`.
- `policy_arns = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]`. List of managed policy ARNs. The type of the variable is `list(string)`.

### Main file example

Example for `main.tf` file:

```terraform
module "instance_iam" {
  source = "../../modules/iam"

  role_name                         = "${var.all_vars.prefix}-${var.all_vars.environment}-instance-role"
  assume_role_principal_type        = var.all_vars.instance_role_principal_type
  assume_role_principal_identifiers = var.all_vars.instance_role_principal_identifiers
  role_policies                     = [
    {
      statements = [
        {
          sid    = "OverridePlaceHolderOne"
          effect = "Allow"
          actions   = ["s3:*"]
          resources = ["*"]
        },
        {
          actions = ["s3:ListBucket"]
          resources = ["arn:aws:s3:::${var.s3_bucket_name}"]
          condition {
            test     = "StringLike"
            variable = "s3:prefix"
            values = [
              "",
              "home/",
              "home/&{aws:username}/"
            ]
          }
        }
        ...
      ]
    }
  ]
  managed_policy_arns               = var.all_vars.instance_role_managed_policy_arns
}
```

## Outputs

This module outputs `instance_profile_name` and `role_arn`.