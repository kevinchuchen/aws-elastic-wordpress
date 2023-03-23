# resource "aws_autoscaling_group" "WP-ASG" {
#   name_prefix               = "WP-ASG-"
#   max_size                  = 1
#   min_size                  = 1
#   desired_capacity          = 1
#   vpc_zone_identifier       = [var.SNPUB-A-ID, var.SNPUB-B-ID, var.SNPUB-C-ID]
#   target_group_arns         = [aws_lb_target_group.WP-ALB-TG.arn]
#   health_check_grace_period = 300
#   health_check_type         = "ELB"
#   metrics_granularity       = "1Minute"
#   # enabled_metrics           = [""]
#   protect_from_scale_in = false
#   launch_template {
#     id      = aws_launch_template.ec2-launch-template.id
#     version = "$Default"
#   }
#   tag {
#     key                 = "Name"
#     value               = "WORDPRESS-ASG"
#     propagate_at_launch = true
#   }
#   depends_on = [var.RDS-endpoint-address, var.EFS-ID, aws_lb.WP-ALB]
# }