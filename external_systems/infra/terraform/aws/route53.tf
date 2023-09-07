/* Route53 zone */
module "route53_zone" {
  source = "./modules/route53_hosted_zone"

  environment = var.all_vars.environment
  name        = "example.com"
  tags        = var.tags
}

/* Record pointing to CF Distriburtion */
resource "aws_route53_record" "smarthome_bogdanovski_net" {
  zone_id = module.route53_zone.hosted_zone_id
  name    = var.all_vars.base_domain
  type    = "A"

  alias {
    name                   = module.cf_distribution.domain_name
    zone_id                = module.cf_distribution.hosted_zone_id
    evaluate_target_health = true
  }
}

/* InfluxDB instance public DNS name */
data "aws_instance" "influxdb_instance" {
  instance_tags = var.influxdb_vars.instance.tags
  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
  depends_on = [module.influxdb_asg]
}

/* Record pointing to InfluxDB instance */
resource "aws_route53_record" "influxdb_smarthome_bogdanovski_net" {
  zone_id = module.route53_zone.hosted_zone_id
  name    = var.all_vars.influxdb_domain
  type    = "A"
  ttl     = 300

  records = [data.aws_instance.influxdb_instance.public_ip]
}
