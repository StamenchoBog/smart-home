# RDS DB instance module

The RDS DB instance module creates RDS database instance from the given variables.

## Module logic and accepted variables

The module accepts couple of variables and creates RDS database instance depending on their values. Certain variables have default values in order to match security guidelines and recommended policies and standards.

### Resources

| Name | Type |
|------|------|
| [aws_db_instance.db_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |

### Variables

In the `variables.tf` file we can specify values as follows. Below is a table that has all variables accepted by the module, and their types, default values and if they are required or not.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | If replicate\_source\_db is set, the value is ignored during the creation of the instance. | `number` | n/a | yes |
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | n/a | `bool` | `null` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | n/a | `bool` | `null` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | n/a | `bool` | `null` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Only for One AZ | `string` | `null` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | n/a | `number` | `null` | no |
| <a name="input_backup_window"></a> [backup\_window](#input\_backup\_window) | n/a | `string` | `null` | no |
| <a name="input_blue_green_update"></a> [blue\_green\_update](#input\_blue\_green\_update) | n/a | <pre>object({<br>    enabled = bool<br>  })</pre> | `null` | no |
| <a name="input_ca_cert_identifier"></a> [ca\_cert\_identifier](#input\_ca\_cert\_identifier) | n/a | `string` | `null` | no |
| <a name="input_character_set_name"></a> [character\_set\_name](#input\_character\_set\_name) | n/a | `string` | `null` | no |
| <a name="input_custom_iam_instance_profile"></a> [custom\_iam\_instance\_profile](#input\_custom\_iam\_instance\_profile) | IAM | `string` | `null` | no |
| <a name="input_customer_owned_ip_enabled"></a> [customer\_owned\_ip\_enabled](#input\_customer\_owned\_ip\_enabled) | n/a | `bool` | `null` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | n/a | `string` | `null` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | n/a | `string` | `null` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Deployment and deletion configuration | `bool` | `null` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Active Directory | `string` | `null` | no |
| <a name="input_domain_iam_role_name"></a> [domain\_iam\_role\_name](#input\_domain\_iam\_role\_name) | n/a | `string` | `null` | no |
| <a name="input_enable_copy_tags_to_snapshot"></a> [enable\_copy\_tags\_to\_snapshot](#input\_enable\_copy\_tags\_to\_snapshot) | n/a | `bool` | `null` | no |
| <a name="input_enable_delete_automated_backups"></a> [enable\_delete\_automated\_backups](#input\_enable\_delete\_automated\_backups) | Snapshot & Backups | `bool` | `null` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | Logs | `set(string)` | `null` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | Engine | `string` | `null` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | n/a | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | n/a | `bool` | `null` | no |
| <a name="input_iam_database_authentication_enabled"></a> [iam\_database\_authentication\_enabled](#input\_iam\_database\_authentication\_enabled) | n/a | `bool` | `null` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | n/a | `string` | `null` | no |
| <a name="input_identifier_prefix"></a> [identifier\_prefix](#input\_identifier\_prefix) | Conflicts with `identifier`. | `string` | `null` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | n/a | `string` | n/a | yes |
| <a name="input_iops"></a> [iops](#input\_iops) | n/a | `string` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | Encryption | `string` | `null` | no |
| <a name="input_license_model"></a> [license\_model](#input\_license\_model) | Licences and certificates | `string` | `null` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | n/a | `string` | `null` | no |
| <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage) | n/a | `number` | `null` | no |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | Monitoring | `number` | `null` | no |
| <a name="input_monitoring_role_arn"></a> [monitoring\_role\_arn](#input\_monitoring\_role\_arn) | n/a | `string` | `null` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | n/a | `bool` | `null` | no |
| <a name="input_nchar_character_set_name"></a> [nchar\_character\_set\_name](#input\_nchar\_character\_set\_name) | n/a | `string` | `null` | no |
| <a name="input_network_type"></a> [network\_type](#input\_network\_type) | n/a | `string` | `null` | no |
| <a name="input_option_group_name"></a> [option\_group\_name](#input\_option\_group\_name) | n/a | `string` | `null` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | n/a | `string` | `null` | no |
| <a name="input_password"></a> [password](#input\_password) | n/a | `string` | `null` | no |
| <a name="input_performance_insights_enabled"></a> [performance\_insights\_enabled](#input\_performance\_insights\_enabled) | n/a | `bool` | `null` | no |
| <a name="input_performance_insights_kms_key_id"></a> [performance\_insights\_kms\_key\_id](#input\_performance\_insights\_kms\_key\_id) | n/a | `string` | `null` | no |
| <a name="input_performance_insights_retention_period"></a> [performance\_insights\_retention\_period](#input\_performance\_insights\_retention\_period) | n/a | `number` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | n/a | `number` | `null` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | n/a | `bool` | `null` | no |
| <a name="input_replica_mode"></a> [replica\_mode](#input\_replica\_mode) | n/a | `string` | `null` | no |
| <a name="input_replicate_source_db"></a> [replicate\_source\_db](#input\_replicate\_source\_db) | n/a | `string` | `null` | no |
| <a name="input_restore_to_point_in_time"></a> [restore\_to\_point\_in\_time](#input\_restore\_to\_point\_in\_time) | n/a | <pre>object({<br>    restore_time                             = optional(string)<br>    source_db_instance_identifier            = optional(string)<br>    source_db_instance_automated_backups_arn = optional(string)<br>    source_dbi_resource_id                   = optional(string)<br>    use_latest_restorable_time               = optional(bool)<br>  })</pre> | `null` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | n/a | `bool` | `null` | no |
| <a name="input_snapshot_identifier"></a> [snapshot\_identifier](#input\_snapshot\_identifier) | n/a | `string` | `null` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | n/a | `bool` | `null` | no |
| <a name="input_storage_throughput"></a> [storage\_throughput](#input\_storage\_throughput) | n/a | `string` | `null` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | n/a | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `null` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | n/a | `string` | `null` | no |
| <a name="input_username"></a> [username](#input\_username) | n/a | `string` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | Network | `set(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address"></a> [address](#output\_address) | The hostname of the RDS instance. |
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the RDS instance. |
| <a name="output_port"></a> [port](#output\_port) | The database port. |

## Usage

Example usage for `main.tf` file:

```terraform
module "db_instance" {
  source = "../../modules/rds_db_instance"
  allocated_storage     = var.rds.allocated_storage
  max_allocated_storage = var.rds.max_allocated_storage
  instance_class        = var.rds.instance_class

  db_name        = var.rds.db_name
  engine         = var.rds.engine
  engine_version = var.rds.engine_version
  username       = jsondecode(data.aws_secretsmanager_secret_version.db_credentials.secret_string)["master_username"]
  password       = jsondecode(data.aws_secretsmanager_secret_version.db_credentials.secret_string)["master_password"]

  backup_window           = var.rds.backup_window
  maintenance_window      = var.rds.maintenance_window
  backup_retention_period = var.rds.backup_retention_period

  skip_final_snapshot        = var.rds.skip_final_snapshot
  auto_minor_version_upgrade = var.rds.auto_minor_version_upgrade
  apply_immediately          = var.rds.apply_immediately

  # Low-downtime updates
  blue_green_update = var.rds.blue_green_update
}
```
