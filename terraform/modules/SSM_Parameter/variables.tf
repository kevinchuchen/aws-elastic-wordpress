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