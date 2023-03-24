resource "aws_autoscaling_group" "WP-ASG" {
  name_prefix               = "WP-ASG-"
  max_size                  = 3
  min_size                  = 1
  vpc_zone_identifier       = [var.SNPUB-A-ID, var.SNPUB-B-ID, var.SNPUB-C-ID]
  target_group_arns         = [aws_lb_target_group.WP-ALB-TG.arn]
  health_check_grace_period = 300
  health_check_type         = "ELB"
  metrics_granularity       = "1Minute"
  enabled_metrics           = ["GroupMinSize","GroupMaxSize","GroupDesiredCapacity","GroupInServiceInstances","GroupPendingInstances","GroupStandbyInstances","GroupTerminatingInstances","GroupTotalInstances","GroupInServiceCapacity","GroupPendingCapacity","GroupStandbyCapacity","GroupTerminatingCapacity","GroupTotalCapacity","WarmPoolDesiredCapacity","WarmPoolWarmedCapacity","WarmPoolPendingCapacity","WarmPoolTerminatingCapacity","WarmPoolTotalCapacity","GroupAndWarmPoolDesiredCapacity","GroupAndWarmPoolTotalCapacity"]

  protect_from_scale_in = false
  launch_template {
    id      = aws_launch_template.ec2-launch-template.id
    version = "$Default"
  }
  tag {
    key                 = "Name"
    value               = "WORDPRESS-ASG"
    propagate_at_launch = true
  }
  depends_on = [var.RDS-endpoint-address, var.EFS-ID, aws_lb.WP-ALB]
}

resource "aws_cloudwatch_metric_alarm" "WP_HIGH_CPU_UTIL" {
  alarm_name                = "WP_HIGH_CPU_UTIL"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 40
  alarm_description         = "This metric monitors ec2 cpu utilization"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.WP-ASG.name
  }
  alarm_actions = [aws_autoscaling_policy.HIGH_CPU_ACTION.arn]
}

resource "aws_cloudwatch_metric_alarm" "WP_LOW_CPU_UTIL" {
  alarm_name                = "WP_LOW_CPU_UTIL"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 40
  alarm_description         = "This metric monitors ec2 cpu utilization"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.WP-ASG.name
  }
  alarm_actions = [aws_autoscaling_policy.LOW_CPU_ACTION.arn]

}

resource "aws_autoscaling_policy" "HIGH_CPU_ACTION" {
  name                   = "HIGH_CPU_ACTION"
  scaling_adjustment     = 2 #adds two instance
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.WP-ASG.name
}

resource "aws_autoscaling_policy" "LOW_CPU_ACTION" {
  name                   = "LOW_CPU_ACTION"
  scaling_adjustment     = -2 #removes two instance
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.WP-ASG.name
}