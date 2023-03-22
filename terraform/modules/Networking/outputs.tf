output "WP-security-group-id" {
  value = aws_security_group.SG-WP.id
}
output "DB-security-group-id" {
  value = aws_security_group.SG-DB.id
}
output "EFS-security-group-id" {
  value = aws_security_group.SG-EFS.id
}
output "ALB-security-group-id" {
  value = aws_security_group.SG-ALB.id
}

output "SNDB-A-ID" {
  value = aws_subnet.SNDB-A.id
}
output "SNDB-B-ID" {
  value = aws_subnet.SNDB-B.id
}
output "SNDB-C-ID" {
  value = aws_subnet.SNDB-C.id
}

output "SNAPP-A-ID" {
  value = aws_subnet.SNAPP-A.id
}
output "SNAPP-B-ID" {
  value = aws_subnet.SNAPP-B.id
}
output "SNAPP-C-ID" {
  value = aws_subnet.SNAPP-C.id
}


output "SNPUB-A-ID" {
  value = aws_subnet.SNPUB-A.id
}
output "SNPUB-B-ID" {
  value = aws_subnet.SNPUB-B.id
}
output "SNPUB-C-ID" {
  value = aws_subnet.SNPUB-C.id
}

output "VPC-ID" {
  value = aws_vpc.main.id
}