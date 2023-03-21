output "RDS-ENDPOINT"{
    value = aws_db_instance.wp-rds-db.address
}