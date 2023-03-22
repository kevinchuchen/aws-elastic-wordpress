#output FS-ID to send to SSM-parameter
output "FS-ID" {
  value = aws_efs_file_system.WP-EFS.id
}