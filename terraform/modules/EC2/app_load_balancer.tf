# resource "aws_lb" "WP-ALB" {
#   name_prefix        = "WP-LB-"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [var.ALB-SG-ID]
#   subnets            = [var.SNPUB-A-ID, var.SNPUB-B-ID, var.SNPUB-C-ID]
# }

# resource "aws_lb_target_group" "WP-ALB-TG" {
#   name_prefix      = "LB-TG-"
#   target_type      = "instance"
#   port             = 80
#   protocol         = "HTTP"
#   protocol_version = "HTTP1"
#   vpc_id           = var.VPC-ID
# }

# resource "aws_lb_listener" "WP-ALB-Listener" {
#   load_balancer_arn = aws_lb.WP-ALB.arn
#   port              = 80
#   protocol          = "HTTP"
#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.WP-ALB-TG.arn
#   }
# }