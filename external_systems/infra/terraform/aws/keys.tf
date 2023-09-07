/* SSH key */
module "key_pair" {
  source = "./modules/key_pair"

  environment = var.all_vars.environment
  key_name    = "${var.all_vars.prefix}-${var.all_vars.environment}-key"
  tags        = var.tags
}
