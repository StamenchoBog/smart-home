resource "aws_codedeploy_deployment_group" "codedeploy_dg" {
  app_name              = var.app_name
  deployment_group_name = var.name
  service_role_arn      = var.codedeploy_role

  autoscaling_groups = [var.asg_name]

  auto_rollback_configuration {
    enabled = var.auto_rollback
    events  = var.rollback_events
  }
  tags = merge(var.tags, {
    Environment = var.environment
  })
  #TODO: Complete the module with all the features offered
}