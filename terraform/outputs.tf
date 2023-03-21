output "region" {
    value = data.aws_region.current.name
}

output "DB-NAME" {
    value = module.SSM_Parameter.RDS-DB-NAME
    sensitive = true
}

output "DB-ENDPOINT" {
    value = module.RDS_Instance.RDS-ENDPOINT
}

output "EFS-ID" {
    value = module.EFS_Instance.FS-ID
}