# resource "aws_instance" "WP-instance" {
#   subnet_id = var.SNPUB-A-ID
#   launch_template {
#     id = aws_launch_template.ec2-launch-template.id
#   }
#   tags = {
#     Name = "WP-ec2-instance"
#   }
#   depends_on = [var.RDS-endpoint-address, var.EFS-ID, aws_lb.WP-ALB]
# } 