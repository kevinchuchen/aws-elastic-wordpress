resource "aws_ssm_parameter" "ALB-DNS-URL" {
  name  = "/Wordpress/ALBDNSNAME"
  type  = "String"
  value = var.ALB-DNS
}
