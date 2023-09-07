/* Random integer */
resource "random_id" "unique_id" {
  byte_length = 16
}

/* Generated random passwords */
resource "random_password" "generated_passwords" {
  count            = 3
  length           = 32
  special          = true
  override_special = "!#$%^&*<>?{}[]"
}

/* RDS credentials */
module "db_master_password" {
  source      = "./modules/ssm_parameter"
  environment = var.all_vars.environment

  name        = "/smart-home/production/database/master/password"
  description = "Master password for RDS database"
  type        = "SecureString"
  value       = random_password.generated_passwords[0].result
  tags        = var.tags
}

/* Home assistant credentials */
module "homeassistant_password" {
  source      = "./modules/ssm_parameter"
  environment = var.all_vars.environment

  name        = "/smart-home/production/homeassistant/password"
  description = "Master password for Home Assistant DB user"
  type        = "SecureString"
  value       = random_password.generated_passwords[1].result
  tags        = var.tags

}

/* InfluxDB credentials */
module "influxdb_user" {
  source      = "./modules/ssm_parameter"
  environment = var.all_vars.environment

  name        = "/smart-home/production/influxdb/user"
  description = "Master user for InfluxDB"
  type        = "SecureString"
  value       = "homeassistant_${random_id.unique_id.id}"
  tags        = var.tags
}
module "influxdb_password" {
  source      = "./modules/ssm_parameter"
  environment = var.all_vars.environment

  name        = "/smart-home/production/influxdb/password"
  description = "Master password for InfluxDB"
  type        = "SecureString"
  value       = random_password.generated_passwords[2].result
  tags        = var.tags
}
module "influxdb_org" {
  source      = "./modules/ssm_parameter"
  environment = var.all_vars.environment

  name        = "/smart-home/production/influxdb/org"
  description = "Organization for InfluxDB"
  type        = "SecureString"
  value       = "home_${random_id.unique_id.id}"
  tags        = var.tags
}
module "influxdb_bucket" {
  source      = "./modules/ssm_parameter"
  environment = var.all_vars.environment

  name        = "/smart-home/production/influxdb/bucket"
  description = "Bucket for InfluxDB"
  type        = "SecureString"
  value       = "homeassistant_${random_id.unique_id.id}"
  tags        = var.tags
}
