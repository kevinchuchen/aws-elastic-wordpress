variable "DBPassword" {
  type        = string
  description = "DB Password"
  sensitive   = true
}

variable "DBRootPassword" {
  type        = string
  description = "DB Root Password"
  sensitive   = true
}

variable "DB-ENDPOINT" {
  type        = string
  description = "DB-endpoint from RDS"
}

variable "EFS-ID" {
  type        = string
  description = "EFS File system ID"
}

variable "ALB-DNS" {
  type        = string
  description = "ALB DNS url"
}