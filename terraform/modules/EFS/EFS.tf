resource "aws_efs_file_system" "WP-EFS" {
  creation_token = "WP-CONTENT"

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
    tags = {
     Name = "WP-Content-EFS"
  }
}
resource "aws_efs_backup_policy" "policy" {
  file_system_id = aws_efs_file_system.WP-EFS.id

  backup_policy {
    status = "ENABLED"
  }
}
resource "aws_efs_mount_target" "SNAPP-A-MOUNT-TARGET" {
  file_system_id = aws_efs_file_system.WP-EFS.id
  subnet_id      = var.SNAPP-A-ID
  security_groups = [var.EFS-SG-ID]
}

resource "aws_efs_mount_target" "SNAPP-B-MOUNT-TARGET" {
  file_system_id = aws_efs_file_system.WP-EFS.id
  subnet_id      = var.SNAPP-B-ID
  security_groups = [var.EFS-SG-ID]
}

resource "aws_efs_mount_target" "SNAPP-C-MOUNT-TARGET" {
  file_system_id = aws_efs_file_system.WP-EFS.id
  subnet_id      = var.SNAPP-C-ID
  security_groups = [var.EFS-SG-ID]
}