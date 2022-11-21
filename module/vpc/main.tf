
# création du réseau

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
      "Name" = "${var.PREFIX}-vpc"
      "kubernetes.io/cluster/${var.NOM_CLUSTER}" = "shared"

    }
}

# création des sous-réseaux publics

resource "aws_subnet" "public-subnet-1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.0.0/19"
  availability_zone = "${var.AWS_REGION}a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "${var.PREFIX}-public-1a"
    "kubernetes.io/cluster/${var.NOM_CLUSTER}" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.32.0/19"
  availability_zone = "${var.AWS_REGION}b"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "${var.PREFIX}-public-1b"
    "kubernetes.io/cluster/${var.NOM_CLUSTER}" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
}

# création des sous-réseaux privées

resource "aws_subnet" "private-subnet-1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.64.0/19"
  availability_zone = "${var.AWS_REGION}a"

  tags = {
    "Name" = "${var.PREFIX}-private-1a"
    "kubernetes.io/cluster/beopenmairie-cluster" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.96.0/19"
  availability_zone = "${var.AWS_REGION}b"

  tags = {
    "Name" = "${var.PREFIX}-private-1b"
    "kubernetes.io/cluster/beopenmairie-cluster" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  }
}