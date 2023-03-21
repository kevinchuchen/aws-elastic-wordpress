output "WP-security-group-id"{
    value = aws_security_group.SG-WP.id
}
output "DB-security-group-id"{
    value = aws_security_group.SG-DB.id
}

output "SNDB-A-ID"{
    value = aws_subnet.SNDB-A.id
}
output "SNDB-B-ID"{
    value = aws_subnet.SNDB-B.id
}
output "SNDB-C-ID"{
    value = aws_subnet.SNDB-C.id
}
output "SNPUB-A-ID"{
    value = aws_subnet.SNPUB-A.id
}