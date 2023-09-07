# ElastiCache cluster module

The ElastiCache cluster module creates ElastiCache cluster from the given variables.

## Module logic and accepted variables

The module accepts couple of variables and provides an ElastiCache Cluster resource, which manages either a Memcached cluster, a single-node Redis instance, or a [read replica in a Redis (Cluster Mode Enabled) replication group] depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards.

### Resources

| Name | Type |
|------|------|
| [aws_elasticache_cluster.elasticache_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

| Name | Description | Type | Default | Required |
|------|-------------|------|------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | n/a | `bool` | `null` |    no    |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | n/a | `bool` | `null` |    no    |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | n/a | `string` | `null` |    no    |
| <a name="input_az_mode"></a> [az\_mode](#input\_az\_mode) | n/a | `string` | `null` |    no    |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | n/a | `string` | `null` |    no    |
| <a name="input_engine"></a> [engine](#input\_engine) | Required if replication\_group\_id is not specified | `string` | `null` |    no    |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | n/a | `string` | `null` |    no    |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a  |   yes    |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | optional, Redis only | `string` | `null` |    no    |
| <a name="input_ip_discovery"></a> [ip\_discovery](#input\_ip\_discovery) | n/a | `string` | `null` |    no    |
| <a name="input_log_delivery_configurations"></a> [log\_delivery\_configurations](#input\_log\_delivery\_configurations) | n/a | <pre>set(object({<br>    destination      = string<br>    destination_type = string<br>    log_format       = string<br>    log_type         = string<br>  }))</pre> | null |    no    |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | n/a | `string` | `null` |    no    |
| <a name="input_network_type"></a> [network\_type](#input\_network\_type) | n/a | `string` | `null` |    no    |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | Required unless replication\_group\_id is provided | `string` | `null` |    no    |
| <a name="input_notification_topic_arn"></a> [notification\_topic\_arn](#input\_notification\_topic\_arn) | n/a | `string` | `null` |    no    |
| <a name="input_num_cache_nodes"></a> [num\_cache\_nodes](#input\_num\_cache\_nodes) | Required unless replication\_group\_id is provided | `number` | `null` |    no    |
| <a name="input_outpost_mode"></a> [outpost\_mode](#input\_outpost\_mode) | n/a | `string` | `null` |    no    |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Required unless replication\_group\_id is provided | `string` | `null` |    no    |
| <a name="input_port"></a> [port](#input\_port) | n/a | `number` | `null` |    no    |
| <a name="input_preferred_availability_zones"></a> [preferred\_availability\_zones](#input\_preferred\_availability\_zones) | optional, Memcached only | `list(string)` | `null` |    no    |
| <a name="input_preferred_outpost_arn"></a> [preferred\_outpost\_arn](#input\_preferred\_outpost\_arn) | optional, Required if outpost\_mode is specified | `string` | `null` |    no    |
| <a name="input_replication_group_id"></a> [replication\_group\_id](#input\_replication\_group\_id) | optional, Required if engine is not specified | `string` | `null` |    no    |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | n/a | `list(string)` | `null` |    no    |
| <a name="input_snapshot_arns"></a> [snapshot\_arns](#input\_snapshot\_arns) | optional, Redis only | `list(string)` | `null` |    no    |
| <a name="input_snapshot_name"></a> [snapshot\_name](#input\_snapshot\_name) | optional, Redis only | `string` | `null` |    no    |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | optional, Redis only | `string` | `null` |    no    |
| <a name="input_snapshot_window"></a> [snapshot\_window](#input\_snapshot\_window) | optional, Redis only | `string` | `null` |    no    |
| <a name="input_subnet_group_name"></a> [subnet\_group\_name](#input\_subnet\_group\_name) | n/a | `string` | `null` |    no    |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `null` |   yes    |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the created ElastiCache Cluster. |
| <a name="output_cache_nodes"></a> [cache\_nodes](#output\_cache\_nodes) | List of node objects including id, address, port and availability\_zone. |

## Usage

Example usage for `main.tf` file:

```terraform
module "elasticache_cluster" {
  source      = "../../modules/elasticache_cluster"
  cluster_id           = "cluster-example"
  engine               = "memcached"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 2
  parameter_group_name = "default.memcached1.4"
  port                 = 11211
}
```
