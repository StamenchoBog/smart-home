/* Application EC2 instance security group */
module "application_server_security_group" {
  source        = "./modules/security_group"
  vpc_id        = module.vpc.vpc_id
  name          = var.homeassistant_vars.instance.security_group.name
  description   = var.homeassistant_vars.instance.security_group.description
  ingress_rules = var.homeassistant_vars.instance.security_group.ingress_rules
  egress_rules  = var.homeassistant_vars.instance.security_group.egress_rules
  tags          = merge(var.tags, var.homeassistant_vars.instance.security_group.tags)
}

/* RDS security group */
module "rds_security_group" {
  source      = "./modules/security_group"
  vpc_id      = module.vpc.vpc_id
  name        = var.mariadb_rds_vars.security_group.name
  description = var.mariadb_rds_vars.security_group.description
  # Databases to accept traffic only from HA
  ingress_rules = [
    {
      description     = "Allow HA to communicate with MariaDB database"
      from_port       = 3306
      to_port         = 3306
      protocol        = "TCP"
      security_groups = [module.application_server_security_group.id]
    },
    {
      description     = "Allow HA to communicate with InfluxDB database"
      from_port       = 8086
      to_port         = 8086
      protocol        = "TCP"
      security_groups = [module.application_server_security_group.id]
    }
  ]
  # Databases to communicate only with HA
  egress_rules = [
    {
      description     = "Allow MariaDB database to communicate with Home Assistant"
      from_port       = 3306
      to_port         = 3306
      protocol        = "TCP"
      security_groups = [module.application_server_security_group.id]
    },
    {
      description     = "Allow InfluxDB database to communicate with Home Assistant"
      from_port       = 8086
      to_port         = 8086
      protocol        = "TCP"
      security_groups = [module.application_server_security_group.id]
    }
  ]
  tags = merge(var.tags, var.mariadb_rds_vars.security_group.tags)
}

/* InfluxDB security group */
module "influxdb_security_group" {
  source      = "./modules/security_group"
  vpc_id      = module.vpc.vpc_id
  name        = var.influxdb_vars.security_group.name
  description = var.influxdb_vars.security_group.description
  # Databases to accept traffic only from HA and Home network
  ingress_rules = [
    {
      description = "Allow connection to InfluxDB WebUI"
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      #tfsec:ignore:aws-ec2-no-public-ingress-sgr
      cidr = ["0.0.0.0/0"]
    },
    {
      description     = "Allow HA to communicate with InfluxDB database"
      from_port       = 8086
      to_port         = 8086
      protocol        = "TCP"
      security_groups = [module.application_server_security_group.id]
    }
  ]
  # Databases to communicate only with HA and home LAN devices
  egress_rules = [
    {
      description = "Allow outbound traffic to anyone"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr        = ["0.0.0.0/0"]
    }
  ]
  tags = merge(var.tags, var.influxdb_vars.security_group.tags)
}

# Added database rules separatly to avoid cycle dependencies
# Home assistant
module "application_server_homeassistant_ingress_rule" {
  source = "./modules/security_group_rule"

  security_group_id = module.application_server_security_group.id
  description       = "Allow world to communicate with Home Assistant"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "TCP"
  #tfsec:ignore:aws-ec2-no-public-ingress-sgr
  cidr_blocks = ["0.0.0.0/0"]
}

# Databases to communicate with HA
module "application_server_mariadb_ingress_rule" {
  source = "./modules/security_group_rule"

  security_group_id        = module.application_server_security_group.id
  description              = "Allow MariaDB database to communicate with Home Assistant"
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "TCP"
  source_security_group_id = module.rds_security_group.id
}
module "application_server_influxdb_ingress_rule" {
  source = "./modules/security_group_rule"

  security_group_id        = module.application_server_security_group.id
  description              = "Allow InfluxDB database to communicate with Home Assistant"
  type                     = "ingress"
  from_port                = 8086
  to_port                  = 8086
  protocol                 = "TCP"
  source_security_group_id = module.influxdb_security_group.id
}


