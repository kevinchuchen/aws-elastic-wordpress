resource "aws_route_table" "PUB-SN-RT"{
    vpc_id = aws_vpc.main.id

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.WP-IGW.id
    }

    route {
        ipv6_cidr_block = "::/0"
        gateway_id = aws_internet_gateway.WP-IGW.id
     }

    tags = {
        Name = "VPC-WP-RT-PUB"
    }
}

resource "aws_route_table_association" "RT-PUB-SNA"{
    subnet_id = aws_subnet.SNPUB-A.id
    route_table_id = aws_route_table.PUB-SN-RT.id
}

resource "aws_route_table_association" "RT-PUB-SNB"{
    subnet_id = aws_subnet.SNPUB-B.id
    route_table_id = aws_route_table.PUB-SN-RT.id
}

resource "aws_route_table_association" "RT-PUB-SNC"{
    subnet_id = aws_subnet.SNPUB-C.id
    route_table_id = aws_route_table.PUB-SN-RT.id
}