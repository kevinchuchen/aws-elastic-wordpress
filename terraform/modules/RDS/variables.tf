variable "SNDB-A-ID"{
    type        = string
    description = "DB of Subnet A ID"
}

variable "SNDB-B-ID"{
    type        = string
    description = "DB of Subnet B ID"
}

variable "SNDB-C-ID"{
    type        = string
    description = "DB of Subnet C ID"
}

variable "SSM-DB-NAME"{
    type        = string
    description = "SSM Parameter for DB Name"
}
variable "SSM-DB-USERNAME"{
    type        = string
    description = "SSM Parameter for DB UserName"
}

variable "SSM-DB-PASSWORD"{
    type        = string
    description = "SSM Parameter for DB Password"
}

variable "SG-DB-ID" {
    type        = string
    description = "Security group for RDS ID"
}

variable "current-region"{
    type        = string
    description = "region to launch template"
}
