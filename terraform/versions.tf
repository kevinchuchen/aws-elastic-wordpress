terraform {
    cloud {
        organization ="LCC-personalSite"
        workspaces {
            name ="aws-elastic-instances"
        }

    }
    required_providers {
        aws= {
            source = "hashicorp/aws"
            version = "~>4.55"
        }
    }
    required_version = ">= 1.2.0"

}