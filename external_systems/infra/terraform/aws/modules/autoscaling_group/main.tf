/* Auto-scaling group */

resource "aws_autoscaling_group" "asg" {
  name = var.name

  desired_capacity = var.desired_capacity
  max_size         = var.max_size
  min_size         = var.min_size

  # VPC subnets to lauch resources in
  vpc_zone_identifier = var.vpc_zone_identifier

  # Instnce cooldown and warmup
  default_cooldown        = var.default_cooldown
  default_instance_warmup = var.default_instance_warmup

  # Health check
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type


  force_delete = var.force_delete

  # Load balancers
  target_group_arns = var.target_group_arns

  # Termination policies & suspend processes
  termination_policies = var.termination_policies
  suspended_processes  = var.suspended_processes

  # Attach already created placement group
  placement_group = var.placement_group_id

  # Elasticity
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
  min_elb_capacity          = var.min_elb_capacity
  wait_for_elb_capacity     = var.wait_for_elb_capacity
  protect_from_scale_in     = var.protect_from_scale_in

  # IAM role for ASG
  service_linked_role_arn = var.service_linked_role_arn

  # Attach already created launch template
  dynamic "launch_template" {
    for_each = var.launch_template[*]

    content {
      id      = launch_template.value.id
      version = launch_template.value.version
    }
  }

  dynamic "instance_refresh" {
    for_each = var.instance_refresh[*]

    content {
      strategy = instance_refresh.value.strategy
      dynamic "preferences" {
        for_each = instance_refresh.value.preferences[*]
        content {
          checkpoint_delay       = preferences.value.checkpoint_delay
          checkpoint_percentages = preferences.value.checkpoint_percentages
          instance_warmup        = preferences.value.instance_warmup
          min_healthy_percentage = preferences.value.min_healthy_percentage
          skip_matching          = preferences.value.skip_matching
        }
      }
      triggers = instance_refresh.value.triggers
    }
  }

  # Tags
  dynamic "tag" {
    for_each = var.tags

    content {
      key                 = tag.value["key"]
      value               = tag.value["value"]
      propagate_at_launch = tag.value["propagate_at_launch"]
    }
  }
}
