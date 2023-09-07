# IAM Policy document module

The IAM policy document module creates IAM policy document from the given variables.

## Module logic and accepted variables

The module accepts couple of variables and provides an IAM policy document resource, which generates an IAM policy document in JSON format for use with resources that expect policy documents such as `aws_iam_policy`.

### Resources

| Name | Type |
|------|------|
| [aws_iam_policy_document.policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_override_policy_documents"></a> [override\_policy\_documents](#input\_override\_policy\_documents) | n/a | `list(string)` | `null` | no |
| <a name="input_policy_id"></a> [policy\_id](#input\_policy\_id) | n/a | `string` | `null` | no |
| <a name="input_policy_version"></a> [policy\_version](#input\_policy\_version) | n/a | `string` | `null` | no |
| <a name="input_source_policy_documents"></a> [source\_policy\_documents](#input\_source\_policy\_documents) | n/a | `list(string)` | `null` | no |
| <a name="input_statements"></a> [statements](#input\_statements) | n/a | <pre>list(object({<br>      sid        = optional(string)<br>      actions    = optional(list(string))<br>      effect     = optional(string)<br>      principals = optional(list(object({<br>        type        = string<br>        identifiers = list(string)<br>      })))<br>      conditions = optional(list(object({<br>        test     = string<br>        variable = string<br>        values   = list(string)<br>      })))<br>      resources = optional(list(string))<br>    }))</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_json"></a> [json](#output\_json) | Standard JSON policy document rendered based on the arguments above. |

## Usage

Example usage for `main.tf` file:

```terraform
module "iam_policy_document" {
  source = "../../modules/iam_policy_document"
  statements = [
    {
      sid = "test-iam-policy-document"
      effect = "Allow"
      actions = ["example_action"]
      resources = ["example_resource"]
    }
  ]
}
```
