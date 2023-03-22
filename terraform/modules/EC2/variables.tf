variable "instance-profile" {
  type        = string
  description = "launch template instance profile"
}

variable "current-region" {
  type        = string
  description = "region to launch template"
}

variable "WP-security-group-id" {
  type        = string
  description = "Security group for Wordpress instance"
}

variable "SNPUB-A-ID" {
  type        = string
  description = "ID of Public Subnet in AZ-A"
}
variable "SNPUB-B-ID" {
  type        = string
  description = "ID of Public Subnet in AZ-B"
}
variable "SNPUB-C-ID" {
  type        = string
  description = "ID of Public Subnet in AZ-C"
}

variable "RDS-endpoint-address" {
  type        = string
  description = "RDS Endpoint address dependancy to ensure RDS is created before bash script is run"
}

variable "EFS-ID" {
  type        = string
  description = "EFS file system dependancy to ensure EFS is created before bash script is run"
}

variable "ALB-SG-ID" {
  type        = string
  description = "App. load balancer Security Group ID"
}

variable "VPC-ID" {
  type        = string
  description = "VPC-ID for ALB"
}
