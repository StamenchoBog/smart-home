resource "aws_codedeploy_app" "codedeploy_app" {
  compute_platform = var.compute_platform
  name             = var.name

  tags = merge(var.tags, {
    Environment = var.environment
  })
  #TODO: Complete the module with all the features offered
}