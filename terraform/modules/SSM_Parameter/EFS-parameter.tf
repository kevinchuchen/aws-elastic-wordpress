resource "aws_ssm_parameter" "EFS-ID" {
  name  = "/Wordpress/EFSFSID"
  type  = "String"
  value = var.EFS-ID
}
