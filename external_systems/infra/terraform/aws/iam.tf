/* Home Assistant EC2 IAM policy document */
module "homeassistant_ec2_iam_policy_document" {
  source = "./modules/iam_policy_document"
  statements = [
    {
      sid       = "AllowEC2ToDescribeAllSSMParameters"
      effect    = "Allow"
      actions   = ["ssm:DescribeParameters"]
      resources = ["*"]
    },
    {
      sid     = "AllowEC2ToReadSSMParameters"
      effect  = "Allow"
      actions = ["ssm:GetParameter*"]
      resources = [
        module.db_master_password.arn,
        module.homeassistant_password.arn
      ]
    },
    {
      sid       = "AllowDecryptWithBucketKMSKey"
      effect    = "Allow"
      actions   = ["kms:Decrypt"]
      resources = [module.cert_and_config_bucket.kms_key_arn]
    },
    {
      sid       = "ListObjectsInBucket"
      effect    = "Allow"
      actions   = ["s3:ListBucket"]
      resources = [module.cert_and_config_bucket.arn]
    },
    {
      sid       = "AllowReadAccessToObjects"
      effect    = "Allow"
      actions   = ["s3:GetObject"]
      resources = ["${module.cert_and_config_bucket.arn}/**"]
    }
  ]
}

/* Home Assistant EC2 IAM policy */
module "homeassistant_ec2_iam_policy" {
  source      = "./modules/iam_policy"
  environment = var.all_vars.environment
  name        = "HomeAssistantCustomPolicy"
  path        = "/"
  policy      = module.homeassistant_ec2_iam_policy_document.json
  tags        = merge(var.tags, var.homeassistant_vars.role.tags)
}

/* Home Assistant EC2 instance IAM role */
module "homeassistant_iam_role" {
  source = "./modules/iam"

  environment                       = var.all_vars.environment
  role_name                         = var.homeassistant_vars.role.name
  assume_role_principal_type        = var.homeassistant_vars.role.principal_type
  assume_role_principal_identifiers = var.homeassistant_vars.role.principal_identifiers
  managed_policy_arns               = concat(var.homeassistant_vars.role.managed_policy_arns, [module.homeassistant_ec2_iam_policy.arn])
  tags                              = merge(var.tags, var.homeassistant_vars.role.tags)
}

/* InfluxDB EC2 IAM policy document */
module "influxdb_ec2_iam_policy_document" {
  source = "./modules/iam_policy_document"
  statements = [
    {
      sid       = "AllowEC2ToDescribeAllSSMParameters"
      effect    = "Allow"
      actions   = ["ssm:DescribeParameters"]
      resources = ["*"]
    },
    {
      sid     = "AllowEC2ToReadSSMParameters"
      effect  = "Allow"
      actions = ["ssm:GetParameter*"]
      resources = [
        module.influxdb_user.arn,
        module.influxdb_password.arn,
        module.influxdb_org.arn,
        module.influxdb_bucket.arn
      ]
    },
    {
      sid       = "AllowDecryptWithBucketKMSKey"
      effect    = "Allow"
      actions   = ["kms:Decrypt"]
      resources = [module.cert_and_config_bucket.kms_key_arn]
    },
    {
      sid       = "ListObjectsInBucket"
      effect    = "Allow"
      actions   = ["s3:ListBucket"]
      resources = [module.cert_and_config_bucket.arn]
    },
    {
      sid       = "AllowReadAccessToObjects"
      effect    = "Allow"
      actions   = ["s3:GetObject"]
      resources = ["${module.cert_and_config_bucket.arn}/**"]
    }
  ]
}

/* InfluxDB EC2 IAM policy */
module "influxdb_ec2_iam_policy" {
  source      = "./modules/iam_policy"
  environment = var.all_vars.environment
  name        = "InfluxDBCustomPolicy"
  path        = "/"
  policy      = module.influxdb_ec2_iam_policy_document.json
  tags        = merge(var.tags, var.influxdb_vars.role.tags)
}

/* InfluxDB EC2 instance IAM role */
module "influxdb_iam_role" {
  source = "./modules/iam"

  environment                       = var.all_vars.environment
  role_name                         = var.influxdb_vars.role.name
  assume_role_principal_type        = var.influxdb_vars.role.principal_type
  assume_role_principal_identifiers = var.influxdb_vars.role.principal_identifiers
  managed_policy_arns               = concat(var.influxdb_vars.role.managed_policy_arns, [module.influxdb_ec2_iam_policy.arn])
  tags                              = merge(var.tags, var.influxdb_vars.role.tags)
}
