resource "aws_db_instance" "wp-rds-db" {
  identifier_prefix          = "wp-rds-db-"
  db_name                    = var.SSM-DB-NAME
  engine                     = "mysql"
  engine_version             = "8.0"
  availability_zone          = "${var.current-region}a"
  auto_minor_version_upgrade = true
  instance_class             = "db.t3.micro"
  multi_az                   = false
  username                   = var.SSM-DB-USERNAME
  password                   = var.SSM-DB-PASSWORD
  db_subnet_group_name       = aws_db_subnet_group.WP-RDS-sn-group.name
  publicly_accessible        = false
  allocated_storage          = 200
  max_allocated_storage      = 1000
  vpc_security_group_ids     = [var.SG-DB-ID]
  skip_final_snapshot        = true
}