data "aws_ami" "eks-worker" {
  filter {
    name   = "name"
    values = ["amazon-eks-node-${var.eks_version}-v*"]
  }

  most_recent = true
  owners      = ["602401143452"] # Amazon
}

locals {
  current_node_userdata = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${var.eks_endpoint}' --b64-cluster-ca '${var.eks_authority}' '${var.cluster_name}'
USERDATA

}

resource "time_sleep" "wait_10_seconds" {
  depends_on = [
    aws_launch_template.current
  ]

  create_duration  = "10s"
  destroy_duration = "10s"
}

resource "aws_autoscaling_group" "current" {
  count = length(var.worker_pools)

  launch_template {
    id      = aws_launch_template.current[count.index].id
    version = "$Latest"
  }
  max_size            = var.worker_pools[count.index].max_size
  min_size            = var.worker_pools[count.index].min_size
  name                = "${var.cluster_name}-${count.index}"
  vpc_zone_identifier = var.subnet_ids

  tag {
    key                 = "Name"
    value               = "${var.cluster_name}-${count.index}"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.cluster_name}"
    value               = "owned"
    propagate_at_launch = true
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      checkpoint_delay = 600
    }
  }

  depends_on = [
    time_sleep.wait_10_seconds
  ]
}

resource "aws_launch_template" "current" {
  count = length(var.worker_pools)

  name          = "${var.cluster_name}-launch-template"
  image_id      = data.aws_ami.eks-worker.id
  user_data     = base64encode(local.current_node_userdata)
  instance_type = var.worker_pools[count.index].instance_type

  iam_instance_profile {
    name = var.instance_profile
  }

  network_interfaces {
    security_groups             = var.security_groups
    associate_public_ip_address = false
  }
  lifecycle {
    create_before_destroy = true
  }

  tags = merge(var.lt_tags, {
    Environment = var.environment
  })
}