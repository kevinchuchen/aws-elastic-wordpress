resource "aws_launch_template" "ec2-launch-template"{
    name = "WP-Launch-Template"
    description = "Single server DP and App"
    image_id = data.aws_ami.Amazon-Linux.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [var.WP-security-group-id]
    user_data = filebase64("${path.module}/WP-initialize.sh")
    update_default_version = true
    iam_instance_profile {
        name = var.instance-profile
    }
    placement {
        availability_zone = "${var.current-region}a"
    }
    network_interfaces {
        associate_public_ip_address = true
    }
    credit_specification {
        cpu_credits = "standard"
    }
}


data "aws_ami" "Amazon-Linux"{
    owners = ["amazon"]
    most_recent = true
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    filter {
        name   = "architecture"
        values = ["x86_64"]
    }
    filter {
        name   = "name"
        values = ["amzn2-ami-kernel-5.10-hvm-2.0*"]
    }
}

# resource "aws_launch_template" "foo" {
#   name = "foo"

#   block_device_mappings {
#     device_name = "/dev/sdf"

#     ebs {
#       volume_size = 20
#     }
#   }

#   capacity_reservation_specification {
#     capacity_reservation_preference = "open"
#   }

#   cpu_options {
#     core_count       = 4
#     threads_per_core = 2
#   }

#   credit_specification {
#     cpu_credits = "standard"
#   }

#   disable_api_stop        = true
#   disable_api_termination = true

#   ebs_optimized = true

#   elastic_gpu_specifications {
#     type = "test"
#   }

#   elastic_inference_accelerator {
#     type = "eia1.medium"
#   }

#   iam_instance_profile {
#     name = "test"
#   }

#   image_id = "ami-test"

#   instance_initiated_shutdown_behavior = "terminate"

#   instance_market_options {
#     market_type = "spot"
#   }

#   instance_type = "t2.micro"

#   kernel_id = "test"

#   key_name = "test"

#   license_specification {
#     license_configuration_arn = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
#   }

#   metadata_options {
#     http_endpoint               = "enabled"
#     http_tokens                 = "required"
#     http_put_response_hop_limit = 1
#     instance_metadata_tags      = "enabled"
#   }

#   monitoring {
#     enabled = true
#   }

#   network_interfaces {
#     associate_public_ip_address = true
#   }

#   placement {
#     availability_zone = "us-west-2a"
#   }

#   ram_disk_id = "test"

#   vpc_security_group_ids = ["sg-12345678"]

#   tag_specifications {
#     resource_type = "instance"

#     tags = {
#       Name = "test"
#     }
#   }

#   user_data = filebase64("${path.module}/example.sh")
# }