# CloudFront Response headers policy module

The module `aws_cloudfront_response_headers_policy` provides an CloudFront response headers policy resource.

## Module logic and accepted variables

The module accepts couple of variables and creates `aws_cloudfront_response_headers_policy` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

### Resources

| Name | Type |
|------|------|
| [aws_cloudfront_response_headers_policy.cf_response_headers_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_response_headers_policy) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comment"></a> [comment](#input\_comment) | n/a | `string` | `null` | no |
| <a name="input_cors_config"></a> [cors\_config](#input\_cors\_config) | n/a | <pre>object({<br>        access_control_allow_credentials = bool<br>        access_control_allow_headers = object({<br>            items = list(string)<br>        })<br>        access_control_allow_methods = object({<br>            items = list(string)<br>        })<br>        access_control_allow_origins = object({<br>            items = list(string)<br>        })<br>        access_control_expose_headers = optional(object({<br>            items = list(string)<br>        }))<br>        access_control_max_age_sec = optional(number)<br>        origin_override = bool<br>    })</pre> | `null` | no |
| <a name="input_custom_headers_config"></a> [custom\_headers\_config](#input\_custom\_headers\_config) | n/a | <pre>object({<br>        items = object({<br>            header = string<br>            override = bool<br>            value = string<br>        })<br>    })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_security_headers_config"></a> [security\_headers\_config](#input\_security\_headers\_config) | n/a | <pre>object({<br>        content_security_policy = optional(object({<br>            content_security_policy = string<br>            override = bool<br>        }))<br>        content_type_options = optional(object({<br>            override = bool<br>        }))<br>        frame_options = optional(object({<br>            frame_option = string<br>            override = bool<br>        }))<br>        referrer_policy = optional(object({<br>            referrer_policy = string<br>            override = bool<br>        }))<br>        strict_transport_security = optional(object({<br>            access_control_max_age_sec = number<br>            include_subdomains = optional(bool)<br>            override = bool<br>            preload = optional(bool)<br>        }))<br>        xss_protection = optional(object({<br>            mode_block = bool<br>            override = bool<br>            protection = bool<br>            report_uri = optional(string)<br>        }))<br>    })</pre> | `null` | no |
| <a name="input_server_timing_headers_config"></a> [server\_timing\_headers\_config](#input\_server\_timing\_headers\_config) | n/a | <pre>object({<br>        enabled = bool<br>        sampling_rate = number<br>    })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The identifier for the response headers policy. |

## Usage

Example for `main.tf` file:

```terraform
module "cf_origin_access_identity" {
    source = "../../modules/cloudfront_origin_access_identity"

    comment = "Some comment"
}
```
