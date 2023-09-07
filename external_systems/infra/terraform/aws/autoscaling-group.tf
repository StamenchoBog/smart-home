locals {
  homeassistant_instance_tags = [
    for key, value in var.homeassistant_vars.instance.tags : {
      key                 = key
      value               = value
      propagate_at_launch = true
    }
  ]
  influxdb_instance_tags = [
    for key, value in var.influxdb_vars.instance.tags : {
      key                 = key
      value               = value
      propagate_at_launch = true
    }
  ]
}

/* Home Assistant autoscaling group */
module "homeassistant_asg" {
  source                    = "./modules/autoscaling_group"
  name                      = var.homeassistant_vars.autoscaling_group.name
  min_size                  = var.homeassistant_vars.autoscaling_group.min_size
  desired_capacity          = var.homeassistant_vars.autoscaling_group.desired_capacity
  max_size                  = var.homeassistant_vars.autoscaling_group.max_size
  health_check_grace_period = var.homeassistant_vars.autoscaling_group.health_check_grace_period
  health_check_type         = var.homeassistant_vars.autoscaling_group.health_check_type

  launch_template = {
    id      = module.homeassistant_launch_template.aws_launch_template_id
    version = module.homeassistant_launch_template.latest_version
  }
  instance_refresh     = var.homeassistant_vars.autoscaling_group.instance_refresh
  termination_policies = var.homeassistant_vars.autoscaling_group.termination_policies

  vpc_zone_identifier = [module.vpc.public_subnets_id[0]]
  tags                = local.homeassistant_instance_tags
}

/* InfluxDB autoscaling group */
module "influxdb_asg" {
  source                    = "./modules/autoscaling_group"
  name                      = var.influxdb_vars.autoscaling_group.name
  min_size                  = var.influxdb_vars.autoscaling_group.min_size
  desired_capacity          = var.influxdb_vars.autoscaling_group.desired_capacity
  max_size                  = var.influxdb_vars.autoscaling_group.max_size
  health_check_grace_period = var.influxdb_vars.autoscaling_group.health_check_grace_period
  health_check_type         = var.influxdb_vars.autoscaling_group.health_check_type

  launch_template = {
    id      = module.influxdb_launch_template.aws_launch_template_id
    version = module.influxdb_launch_template.latest_version
  }
  instance_refresh     = var.influxdb_vars.autoscaling_group.instance_refresh
  termination_policies = var.influxdb_vars.autoscaling_group.termination_policies

  vpc_zone_identifier = [module.vpc.public_subnets_id[1]]
  tags                = local.influxdb_instance_tags
}
