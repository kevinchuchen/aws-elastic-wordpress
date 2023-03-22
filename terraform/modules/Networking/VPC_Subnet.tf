resource "aws_vpc" "main" {
  cidr_block                       = "10.16.0.0/16"
  assign_generated_ipv6_cidr_block = true
  enable_dns_hostnames             = true
  enable_dns_support               = true
  tags = {
    Name = "WP-VPC"
  }
}

data "aws_availability_zones" "availableAZ" {
  state = "available"
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
resource "aws_subnet" "SNDB-A" {
  vpc_id                          = aws_vpc.main.id
  cidr_block                      = "10.16.16.0/20"
  availability_zone               = data.aws_availability_zones.availableAZ.names[0]
  ipv6_cidr_block                 = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, 1)
  assign_ipv6_address_on_creation = true
  tags = {
    Name = "SNDB-A"
  }
}
resource "aws_subnet" "SNDB-B" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.80.0/20"
  availability_zone = data.aws_availability_zones.availableAZ.names[1]
  ipv6_cidr_block   = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, 5)

  assign_ipv6_address_on_creation = true

  tags = {
    Name = "SNDB-B"
  }
}
resource "aws_subnet" "SNDB-C" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.144.0/20"
  availability_zone = data.aws_availability_zones.availableAZ.names[2]
  ipv6_cidr_block   = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, 9)

  assign_ipv6_address_on_creation = true

  tags = {
    Name = "SNDB-C"
  }
}

resource "aws_subnet" "SNAPP-A" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.32.0/20"
  availability_zone = data.aws_availability_zones.availableAZ.names[0]
  ipv6_cidr_block   = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, 2)

  assign_ipv6_address_on_creation = true

  tags = {
    Name = "SNAPP-A"
  }
}
resource "aws_subnet" "SNAPP-B" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.96.0/20"
  availability_zone = data.aws_availability_zones.availableAZ.names[1]
  ipv6_cidr_block   = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, 6)

  assign_ipv6_address_on_creation = true

  tags = {
    Name = "SNAPP-B"
  }
}
resource "aws_subnet" "SNAPP-C" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.160.0/20"
  availability_zone = data.aws_availability_zones.availableAZ.names[2]
  ipv6_cidr_block   = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, 10)

  assign_ipv6_address_on_creation = true

  tags = {
    Name = "SNAPP-C"
  }
}

resource "aws_subnet" "SNPUB-A" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.48.0/20"
  availability_zone = data.aws_availability_zones.availableAZ.names[0]
  ipv6_cidr_block   = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, 3)

  assign_ipv6_address_on_creation = true

  tags = {
    Name = "SNPUB-A"
  }
}
resource "aws_subnet" "SNPUB-B" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.112.0/20"
  availability_zone = data.aws_availability_zones.availableAZ.names[1]
  ipv6_cidr_block   = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, 7)

  assign_ipv6_address_on_creation = true

  tags = {
    Name = "SNPUB-B"
  }
}
resource "aws_subnet" "SNPUB-C" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.16.176.0/20"
  availability_zone = data.aws_availability_zones.availableAZ.names[2]
  ipv6_cidr_block   = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, 11)

  assign_ipv6_address_on_creation = true

  tags = {
    Name = "SNPUB-C"
  }
}