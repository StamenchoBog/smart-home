variable "all_vars" {
  type = any
  default = {
    prefix             = "smarthome"
    environment        = "production"
    region             = "eu-west-1"
    availability_zones = ["eu-west-1a", "eu-west-1b"]
    vpc_cidr           = "10.14.0.0/16"
    public_subnets_cidr = [
      # Home assistant
      "10.14.110.0/24",
      # InfluxDB
      "10.14.120.0/24"
    ]
    private_subnets_cidr = [
      # MariaDB RDS private subnets
      "10.14.20.0/24", "10.14.30.0/24"
    ]
    base_domain     = "example.com"
    influxdb_domain = "influxdb.example.com"
  }
}

variable "homeassistant_vars" {
  type = any
  default = {
    # Instance configuration
    instance = {
      instance_type        = "t4g.small"
      enable_ebs_optimized = true
      block_device_mappings = {
        device_name = "/dev/sda1"
        ebs = {
          encrypted             = true
          delete_on_termination = true
          volume_type           = "gp3"
        }
      }
      monitoring = {
        enabled = false
      }
      # Security group
      security_group = {
        name          = "smarthome-prodcution-homeassistant-ec2"
        description   = "Security group for EC2 servers running Home Assistant application"
        ingress_rules = []
        egress_rules = [
          {
            description = "Allow outbound traffic to anyone"
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr        = ["0.0.0.0/0"]
          }
        ]
        tags = {
          Name  = "smarthome-prodcution-homeassistant-ec2"
          Layer = "networking"
        }
      }
      tags = {
        Name            = "smarthome-production-homeassistant"
        Layer           = "application"
        Backup          = "none"
        BackupRetention = 0
        System          = "linux"
      }
    }
    # IAM role
    role = {
      name                  = "smarthome-production-homeassistant-ec2"
      principal_type        = "Service"
      principal_identifiers = ["ec2.amazonaws.com"]
      managed_policy_arns = [
        "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      ]
      tags = {
        Name  = "smarthome-production-homeassistant-ec2"
        Layer = "security"
      }
    }
    # Lacunh template
    launch_template = {
      name                   = "smarthome-production-homeassistant"
      update_default_version = true
      # Rest of the properties are used from the variable `ec2` in var.application_server_ec2
      tags = {
        Name  = "smarthome-production-homeassistant"
        Layer = "application"
      }
    }
    # Autoscaling group
    autoscaling_group = {
      name                      = "smarthome-production-homeassistant"
      min_size                  = 1
      desired_capacity          = 1
      max_size                  = 1
      health_check_grace_period = 300
      health_check_type         = "EC2"
      instance_refresh = {
        strategy = "Rolling"
        preferences = {
          min_healthy_percentage = 100
          skip_matching          = true
        }
      }
      termination_policies = ["OldestLaunchTemplate", "OldestInstance"]
    }
  }
}

variable "mariadb_rds_vars" {
  type = any
  default = {
    identifier                          = "smarthome-production-mariadb"
    enable_multi_az                     = false
    iam_database_authentication_enabled = true
    allocated_storage                   = 5
    max_allocated_storage               = 10
    instance_class                      = "db.t4g.micro"
    admin_username                      = "smarthome"
    db_master_username                  = "admin"
    db_name                             = "smarthome"
    engine                              = "mariadb"
    engine_version                      = "10.6"
    skip_final_snapshot                 = true
    apply_immediately                   = false
    backup_window                       = "02:00-03:00"
    maintenance_window                  = "Mon:03:00-Mon:04:00"
    backup_retention_period             = 1
    deletion_protection                 = true
    blue_green_update = {
      enabled = false
    }
    security_group = {
      name        = "smarthome-production-mariadb"
      description = "Security group for RDS instances holding data for Home Assistant application"
      tags = {
        Name  = "smarthome-production-mariadb"
        Layer = "networking"
      }
    }
    subnet_group = {
      name = "smarthome-production-mariadb"
      tags = {
        Name  = "smarthome-production-mariadb"
        Layer = "networking"
      }
    }
    tags = {
      Name            = "smarthome-production-mariadb"
      Layer           = "database"
      Backup          = "daily"
      BackupRetention = 1
      System          = "mariadb"
    }
  }
}

variable "influxdb_vars" {
  type = any
  default = {
    # Instance configuration
    instance = {
      instance_type        = "t4g.small"
      enable_ebs_optimized = true
      block_device_mappings = {
        device_name = "/dev/sda1"
        ebs = {
          encrypted             = true
          delete_on_termination = true
          volume_type           = "gp3"
        }
      }
      monitoring = {
        enabled = false
      }
      # Security group 
      security_group = {
        name        = "smarthome-production-influxdb-ec2"
        description = "Security group for InfluxDB instance"
        tags = {
          Name  = "smarthome-production-influxdb-ec2"
          Layer = "networking"
        }
      }
      # Tags
      tags = {
        Name            = "smarthome-production-influxdb"
        Layer           = "application"
        Backup          = "none"
        BackupRetention = 0
        System          = "linux"
      }
    }
    # IAM role
    role = {
      name                  = "smarthome-production-influxdb-ec2"
      principal_type        = "Service"
      principal_identifiers = ["ec2.amazonaws.com"]
      managed_policy_arns = [
        "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      ]
      tags = {
        Name  = "smarthome-production-influxdb-ec2"
        Layer = "security"
      }
    }
    # Security group
    security_group = {
      name        = "smarthome-production-influxdb-ec2"
      description = "Security group for InfluxDB instances holding sensor data from Home Assistant"
      tags = {
        Name  = "smarthome-production-influxdb-ec2"
        Layer = "networking"
      }
    }
    # Lacunh template
    launch_template = {
      name                   = "smarthome-production-influxdb"
      update_default_version = true
      # Rest of the properties are used from the variable `ec2` in var.application_server_ec2
      tags = {
        Name  = "smarthome-production-influxdb"
        Layer = "application"
      }
    }
    # Autoscaling group
    autoscaling_group = {
      name                      = "smarthome-production-influxdb"
      min_size                  = 1
      desired_capacity          = 1
      max_size                  = 1
      health_check_grace_period = 300
      health_check_type         = "EC2"
      instance_refresh = {
        strategy = "Rolling"
        preferences = {
          min_healthy_percentage = 100
          skip_matching          = true
        }
      }
      termination_policies = ["OldestLaunchTemplate", "OldestInstance"]
    }
  }
}

variable "s3_bucket_vars" {
  type = any
  default = {
    name                    = "smarthome-production-assets-v2"
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
    versioning              = "Disabled"
    logging = {
      enabled = false
    }
    encryption = {
      enabled   = true
      key_alias = "alias/smarthome-production-bucket-key"
      configuration = {
        deletion_window_in_days = 7
        enable_key_rotation     = false
      }
    }
    lifecycle_configuration = {
      rules = [
        {
          id     = "abort-incomplete-multipart-uploads"
          status = "Enabled"
          abort_incomplete_multipart_upload = {
            days_after_initiation = 7
          }
        }
      ]
    }
    tags = {
      Layer = "storage"
    }
  }
}

variable "cloudfront_vars" {
  type = any
  default = {
    enabled = true
    comment = "Smart Home's CF distribution"
    custom_origin_config = {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
    default_cache_behavior = {
      allowed_methods          = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
      cached_methods           = ["GET", "HEAD"]
      cache_policy_id          = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad" # CachingDisabled
      origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3" # AllViewer
      min_ttl                  = 0
      default_ttl              = 0
      max_ttl                  = 0
      viewer_protocol_policy   = "redirect-to-https"
      compress                 = true
    }
    viewer_certificate = {
      ssl_support_method       = "sni-only"
      minimum_protocol_version = "TLSv1.2_2021"
    }
    restrictions = {
      geo_restriction = {
        restriction_type = "whitelist"
        # Whitelist Macedonia and Switzerland
        locations = ["MK", "CH"]
      }
    }
    tags = {
      Layer = "caching"
    }
  }
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "production"
    Application = "smarthome"
  }
}
