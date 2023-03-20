resource "aws_launch_template" "ec2-launch-template"{
    name = "WP-Launch-Template"
    description = "Single server DP and App"
    image_id = data.aws_ami.Amazon-Linux.id
    instance_type = "t2.micro"
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
        delete_on_termination = true
        security_groups = [var.WP-security-group-id]
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
