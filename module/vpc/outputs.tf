output "vpc_id" {
    value = aws_vpc.main.id
}

output "vpc_net" {
    description = "la plage d'adresse réseau totale"
    value = aws_vpc.main.cidr_block
  
}

output "private_subnet_1_id" {
    description = "l'ID du sous réseau privé 1"
    value = aws_subnet.private-subnet-1.id
}

output "priv_subnet_1a" {
    description = "la plage d'adresse du réseau privé de l'az 1a"
    value = aws_subnet.private-subnet-1.cidr_block
  
}

output "private_subnet_2_id" {
    description = "l'ID du sous réseau privé 2"
    value = aws_subnet.private-subnet-2.id
}

output "priv_subnet_1b" {
    description = "la plage d'adresse du réseau privé de l'az 1b"
    value = aws_subnet.private-subnet-2.cidr_block
  
}

output "public_subnet_1_id" {
    description = "l'ID du sous réseau public 1"
    value = aws_subnet.public-subnet-1.id
}

output "pub_subnet_1a" {
    description = "la plage d'adresse du réseau public de l'az 1a"
    value = aws_subnet.public-subnet-1.cidr_block
  
}

output "public_subnet_2_id" {
    description = "l'ID du sous réseau public 2"
    value = aws_subnet.public-subnet-2.id
}
output "pub_subnet_1b" {
    description = "la plage d'adresse du réseau public de l'az 1b"
    value = aws_subnet.public-subnet-2.cidr_block
  
}