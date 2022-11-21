
# importer les modules nécessaires

# module "network" {
#   source = "../vpc"
  
# }

resource "aws_internet_gateway" "igw" {
  vpc_id = var.network_id

  tags = {
    "Name" = "${var.PREFIX}-igw"
  }
}

resource "aws_route_table" "public-table" {
  vpc_id = var.network_id

  route = [ {
    
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
    core_network_arn = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id = ""
    nat_gateway_id = ""
    instance_id = ""
    ipv6_cidr_block = ""
    local_gateway_id = ""
    carrier_gateway_id = ""
    network_interface_id = ""
    transit_gateway_id = ""
    vpc_endpoint_id = ""
    vpc_peering_connection_id = ""
    
  } ]

  tags = {
    "Name" = "${var.PREFIX}-public_route"
  }
}

resource "aws_route_table_association" "public-association-1a" {
  subnet_id = var.public_subnet_1_id
  route_table_id = aws_route_table.public-table.id
}
resource "aws_route_table_association" "public-association-1b" {
  subnet_id = var.public_subnet_2_id
  route_table_id = aws_route_table.public-table.id
}


resource "aws_eip" "nat-eip" {
  vpc = true

  tags = {
    "Name" = "${var.PREFIX}-nat_eip"
  }
  }

  resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat-eip.id
    subnet_id = var.public_subnet_1_id

    tags = {
      "Name" = "${var.PREFIX}-nat_gw"
    }
    depends_on = [
      aws_internet_gateway.igw
    ]
  }


resource "aws_route_table" "private-table" {
  vpc_id = var.network_id

  route = [ {
    
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
    core_network_arn = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id = ""
    gateway_id = ""
    instance_id = ""
    ipv6_cidr_block = ""
    local_gateway_id = ""
    carrier_gateway_id = ""
    network_interface_id = ""
    transit_gateway_id = ""
    vpc_endpoint_id = ""
    vpc_peering_connection_id = ""
  } ]

  tags = {
    "Name" = "${var.PREFIX}-private_route"
  }
}

resource "aws_route_table_association" "association-private-subnet-1" {
  subnet_id = var.private_subnet_1_id
  route_table_id = aws_route_table.private-table.id
}

resource "aws_route_table_association" "association-private-subnet-2" {
  subnet_id = var.private_subnet_2_id
  route_table_id = aws_route_table.private-table.id
}