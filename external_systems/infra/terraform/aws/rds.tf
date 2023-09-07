/* RDS DB subnet group */
module "db_subnet_group" {
  source      = "./modules/rds_db_subnet_group"
  environment = var.all_vars.environment
  name        = var.mariadb_rds_vars.subnet_group.name
  # Private VPC subnets created for provisioning databases
  subnet_ids = module.vpc.private_subnets_id
  tags       = merge(var.tags, var.mariadb_rds_vars.subnet_group.tags)
}

/* RDS database */
module "db_instance" {
  source                 = "./modules/rds_db_instance"
  environment            = var.all_vars.environment
  identifier             = var.mariadb_rds_vars.identifier
  vpc_security_group_ids = [module.rds_security_group.id]

  multi_az                            = var.mariadb_rds_vars.enable_multi_az
  availability_zone                   = var.all_vars.availability_zones[0]
  db_subnet_group_name                = module.db_subnet_group.id
  iam_database_authentication_enabled = var.mariadb_rds_vars.iam_database_authentication_enabled
  allocated_storage                   = var.mariadb_rds_vars.allocated_storage
  max_allocated_storage               = var.mariadb_rds_vars.max_allocated_storage
  instance_class                      = var.mariadb_rds_vars.instance_class
  db_name                             = var.mariadb_rds_vars.db_name
  engine                              = var.mariadb_rds_vars.engine
  engine_version                      = var.mariadb_rds_vars.engine_version
  username                            = var.mariadb_rds_vars.db_master_username
  password                            = random_password.generated_passwords[0].result
  backup_window                       = var.mariadb_rds_vars.backup_window
  backup_retention_period             = var.mariadb_rds_vars.backup_retention_period
  maintenance_window                  = var.mariadb_rds_vars.maintenance_window
  skip_final_snapshot                 = var.mariadb_rds_vars.skip_final_snapshot
  auto_minor_version_upgrade          = true
  apply_immediately                   = var.mariadb_rds_vars.apply_immediately
  deletion_protection                 = var.mariadb_rds_vars.deletion_protection
  # Low-downtime updates disabled
  blue_green_update = var.mariadb_rds_vars.blue_green_update
  tags              = merge(var.tags, var.mariadb_rds_vars.tags)
}
