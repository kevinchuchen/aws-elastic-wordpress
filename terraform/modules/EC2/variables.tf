variable "instance-profile"{
    type        = string
    description = "launch template instance profile"
}

variable "current-region"{
    type        = string
    description = "region to launch template"
}

variable "WP-security-group-id"{
    type        = string
    description = "Security group for Wordpress instance"
}

variable "SNPUB-A-ID"{
    type        = string
    description = "ID of Public Subnet in AZ-A"
}

variable "RDS-endpoint-address"{
    type        = string
    description = "RDS Endpoint address dependancy to ensure RDS is created before bash script is run"
}