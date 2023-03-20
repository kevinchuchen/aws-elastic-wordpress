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