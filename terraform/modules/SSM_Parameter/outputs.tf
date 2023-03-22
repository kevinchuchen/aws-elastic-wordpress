output "RDS-DB-NAME" {
  value = aws_ssm_parameter.DBName.value
}

output "RDS-DB-USERNAME" {
  value = aws_ssm_parameter.DBUser.value
}
output "RDS-DB-PASSWORD" {
  value = aws_ssm_parameter.DBPassword.value
}