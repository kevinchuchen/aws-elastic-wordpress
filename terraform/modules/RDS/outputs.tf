
#output DB endpoint to send to SSM-parameter
output "RDS-ENDPOINT" {
  value = aws_db_instance.wp-rds-db.address
}