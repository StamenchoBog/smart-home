/* Lauch template */

resource "aws_launch_template" "asg_lt" {
  name = var.name

  # Security groups
  vpc_security_group_ids = var.vpc_security_group_ids

  # User data
  user_data = var.user_data

  # Default version of template
  default_version        = var.default_version
  update_default_version = var.update_default_version


  # Block device
  dynamic "block_device_mappings" {
    for_each = var.block_device_mappings[*]

    content {
      device_name = block_device_mappings.value.device_name
      ebs {
        volume_size           = block_device_mappings.value.ebs.volume_size
        encrypted             = block_device_mappings.value.ebs.encrypted
        delete_on_termination = block_device_mappings.value.ebs.delete_on_termination
        snapshot_id           = block_device_mappings.value.ebs.snapshot_id
        volume_type           = block_device_mappings.value.ebs.volume_type
      }
    }
  }

  dynamic "capacity_reservation_specification" {
    for_each = var.capacity_reservation_specification[*]

    content {
      capacity_reservation_preference = capacity_reservation_specification.value.capacity_reservation_preference
      dynamic "capacity_reservation_target" {
        for_each = var.capacity_reservation_specification.capacity_reservation_target[*]

        content {
          capacity_reservation_id                 = capacity_reservation_specification.value.capacity_reservation_target.value.capacity_reservation_id
          capacity_reservation_resource_group_arn = capacity_reservation_specification.value.capacity_reservation_target.value.capacity_reservation_resource_group_arn

        }
      }
    }
  }


  dynamic "cpu_options" {
    for_each = var.cpu_options[*]

    content {
      core_count       = cpu_options.value.core_count
      threads_per_core = cpu_options.value.threads_per_core
    }
  }

  disable_api_stop        = var.disable_api_stop
  disable_api_termination = var.disable_api_termination

  # EBS optimization
  ebs_optimized = var.ebs_optimized

  # Elastic configuration
  dynamic "elastic_gpu_specifications" {
    for_each = var.elastic_gpu_specifications[*]

    content {
      type = elastic_gpu_specifications.value.type
    }
  }

  dynamic "elastic_inference_accelerator" {
    for_each = var.elastic_inference_accelerator[*]

    content {
      type = elastic_inference_accelerator.value.type
    }
  }

  # Instance profile
  dynamic "iam_instance_profile" {
    for_each = var.iam_instance_profile[*]

    content {
      name = iam_instance_profile.value.name
      arn  = iam_instance_profile.value.arn
    }
  }

  # AMI ID
  image_id = var.image_id

  # Shutdown behavior
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior

  ## Instance type
  instance_type = var.instance_type

  kernel_id = var.kernel_id
  key_name  = var.key_name

  # Licence specification
  dynamic "license_specification" {
    for_each = var.license_specifications
    content {
      license_configuration_arn = license_specification.value["license_configuration_arn"]
    }
  }

  # Maintance
  dynamic "maintenance_options" {
    for_each = var.maintenance_options[*]

    content {
      auto_recovery = maintenance_options.value.auto_recovery
    }
  }

  # Metadata
  metadata_options {
    http_endpoint               = var.metadata_options.http_endpoint
    http_tokens                 = var.metadata_options.http_tokens
    http_put_response_hop_limit = var.metadata_options.http_put_response_hop_limit
    http_protocol_ipv6          = var.metadata_options.http_protocol_ipv6
    instance_metadata_tags      = var.metadata_options.instance_metadata_tags
  }

  # Monitoring
  dynamic "monitoring" {
    for_each = var.monitoring[*]

    content {
      enabled = monitoring.value.enabled

    }
  }

  # Placement group
  dynamic "placement" {
    for_each = var.placement[*]

    content {
      group_name              = placement.value.group_name
      host_id                 = placement.value.host_id
      host_resource_group_arn = placement.value.host_resource_group_arn
      affinity                = placement.value.affinity
      tenancy                 = placement.value.tenancy
      partition_number        = placement.value.partition_number
    }
  }

  # Ram disk ID
  ram_disk_id = var.ram_disk_id

  # Tags
  dynamic "tag_specifications" {
    for_each = var.tag_specifications
    content {
      resource_type = tag_specifications.value["resource_type"]
      tags          = tag_specifications.value["tags"]
    }
  }

  tags = merge(var.tags, {
    Environment = var.environment
  })
}
