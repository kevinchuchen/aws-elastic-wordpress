resource "aws_db_subnet_group" "WP-RDS-sn-group" {
  name_prefix = "wp-rds-sngroup-"
  description = "Wordpress RDS Subnet Group"
  subnet_ids  = [var.SNDB-A-ID, var.SNDB-B-ID, var.SNDB-C-ID]

  tags = {
    Name = "WP DB subnet group"
  }
}