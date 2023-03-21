resource "aws_ssm_parameter" "DBUser" {
  name  = "/Wordpress/DBUser"
  type  = "String"
  value = "WP_User"
}

resource "aws_ssm_parameter" "DBName" {
  name  = "/Wordpress/DBName"
  type  = "String"
  value = "wordpressdb"
}

resource "aws_ssm_parameter" "DBEndpoint" {
  name  = "/Wordpress/DBEndpoint"
  type  = "String"
  value = var.DB-ENDPOINT
}

resource "aws_ssm_parameter" "DBPassword" {
  name  = "/Wordpress/DBPassword"
  type  = "SecureString"
  value = var.DBPassword
}
resource "aws_ssm_parameter" "DBRootPassword" {
  name  = "/Wordpress/DBRootPassword"
  type  = "SecureString"
  value = var.DBRootPassword
}

