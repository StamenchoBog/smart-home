/* Latest AMI for Ubuntu Server 22.04 LTS */
data "aws_ami" "ubuntu_server_22_04" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

/* HomeAssistant LT */
module "homeassistant_launch_template" {
  source = "./modules/launch_template"

  environment   = var.all_vars.environment
  name          = var.homeassistant_vars.launch_template.name
  ebs_optimized = var.homeassistant_vars.instance.enable_ebs_optimized
  iam_instance_profile = {
    arn = module.homeassistant_iam_role.instance_profile_arn
  }
  block_device_mappings = {
    device_name = var.homeassistant_vars.instance.block_device_mappings.device_name
    ebs = {
      encrypted             = var.homeassistant_vars.instance.block_device_mappings.ebs.encrypted
      delete_on_termination = var.homeassistant_vars.instance.block_device_mappings.ebs.delete_on_termination
    }
  }
  image_id      = data.aws_ami.ubuntu_server_22_04.image_id
  instance_type = var.homeassistant_vars.instance.instance_type
  key_name      = module.key_pair.key_name
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }
  monitoring             = var.homeassistant_vars.instance.monitoring
  update_default_version = var.homeassistant_vars.launch_template.update_default_version
  vpc_security_group_ids = [module.application_server_security_group.id]
  user_data = base64encode(templatefile("./scripts/provision_application.sh", {
    BUCKET_NAME = module.cert_and_config_bucket.id,
    REGION      = var.all_vars.region
  }))

  tags = merge(var.tags, var.homeassistant_vars.launch_template.tags)
}

/* InfluxDB LT */
module "influxdb_launch_template" {
  source = "./modules/launch_template"

  environment   = var.all_vars.environment
  name          = var.influxdb_vars.launch_template.name
  ebs_optimized = var.influxdb_vars.instance.enable_ebs_optimized
  iam_instance_profile = {
    arn = module.influxdb_iam_role.instance_profile_arn
  }
  block_device_mappings = {
    device_name = var.influxdb_vars.instance.block_device_mappings.device_name
    ebs = {
      encrypted             = var.influxdb_vars.instance.block_device_mappings.ebs.encrypted
      delete_on_termination = var.influxdb_vars.instance.block_device_mappings.ebs.delete_on_termination
    }
  }
  image_id      = data.aws_ami.ubuntu_server_22_04.image_id
  instance_type = var.influxdb_vars.instance.instance_type
  key_name      = module.key_pair.key_name
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }
  monitoring             = var.influxdb_vars.instance.monitoring
  update_default_version = var.influxdb_vars.launch_template.update_default_version
  vpc_security_group_ids = [module.influxdb_security_group.id]
  user_data = base64encode(templatefile("./scripts/provision_influxdb.sh", {
    BUCKET_NAME = module.cert_and_config_bucket.id,
    REGION      = var.all_vars.region
  }))

  tags = merge(var.tags, var.influxdb_vars.launch_template.tags)
}
