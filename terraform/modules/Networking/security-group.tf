resource "aws_security_group" "SG-WP" {
  name_prefix = "SG-WP-"
  description = "Control access to WordPress instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow HTTP IPv4 IN"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SG-WP"
  }
}

resource "aws_security_group" "SG-DB" {
  name_prefix = "SG-DB-"
  description = "Control access to Database"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Allow MySQL IN"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.SG-WP.id]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SG-DB"
  }
}

resource "aws_security_group" "SG-EFS" {
  name_prefix = "SG-EFS-"
  description = "Control access to File System"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Allow NFS/EFS IPv4 IN"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.SG-WP.id]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SG-EFS"
  }
}

resource "aws_security_group" "SG-ALB" {
  name_prefix = "SG-ALB-"
  description = "Control access to File System"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow HTTP IPv4 IN"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SG-ALB"
  }
}