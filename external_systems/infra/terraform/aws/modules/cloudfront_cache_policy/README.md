# CloudFront Cache policy module

The module `aws_cloudfront_cache_policy` provides CloudFront cache policy.

## Module logic and accepted variables

The module accepts couple of variables and creates `aws_cloudfront_cache_policy` depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards. Other variables have default values in order to be optional and not mandatory.

### Resources

| Name | Type |
|------|------|
| [aws_cloudfront_cache_policy.cf_cache_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_cache_policy) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comment"></a> [comment](#input\_comment) | n/a | `string` | n/a | yes |
| <a name="input_default_ttl"></a> [default\_ttl](#input\_default\_ttl) | n/a | `number` | `null` | no |
| <a name="input_max_ttl"></a> [max\_ttl](#input\_max\_ttl) | n/a | `number` | `null` | no |
| <a name="input_min_ttl"></a> [min\_ttl](#input\_min\_ttl) | n/a | `number` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_parameters_in_cache_key_and_forwarded_to_origin"></a> [parameters\_in\_cache\_key\_and\_forwarded\_to\_origin](#input\_parameters\_in\_cache\_key\_and\_forwarded\_to\_origin) | n/a | <pre>object({<br>    cookies_config = object({<br>      cookie_behavior = string<br>      cookies = optional(object({<br>        items = list(string)<br>      }))<br>    })<br>    headers_config = object({<br>      header_behavior = string<br>      headers = optional(object({<br>        items = list(string)<br>      }))<br>    })<br>    query_strings_config = object({<br>      query_string_behavior = string<br>      query_strings = optional(object({<br>        items = list(string)<br>      }))<br>    })<br>    enable_accept_encoding_brotli = optional(bool)<br>    enable_accept_encoding_gzip   = optional(bool)<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The identifier for the cache policy. |

## Usage

Example for `main.tf` file:

```terraform
module "example" {
  source = "../../modules/cloudfront_cache_policy"
  
  name        = "example-policy"
  comment     = "test comment"
  default_ttl = 50
  max_ttl     = 100
  min_ttl     = 1
  
  parameters_in_cache_key_and_forwarded_to_origin = {
    
    cookies_config = {
      cookie_behavior = "whitelist"
      cookies = {
        items = ["example"]
      }
    }
    
    headers_confi = {
      header_behavior = "whitelist"
      headers = {
        items = ["example"]
      }
    }
    
    query_strings_config = {
      query_string_behavior = "whitelist"
      query_strings = {
        items = ["example"]
      }
    }
  }
}
```
