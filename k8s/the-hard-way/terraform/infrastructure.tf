data "aws_availability_zones" "aws_az" {
  state = "available"
}

resource "aws_vpc" "vpc" {
  cidr_block           = "11.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.app_name}_vpc"
  }
}

resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "11.0.1.0/24"
  availability_zone = data.aws_availability_zones.aws_az.names[0]
  tags = {
    Name = "${var.app_name}_public_subnet_1"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.app_name}_igw"
  }
}

resource "aws_eip" "nat" {
  vpc = true
  tags = {
    Name = "${var.app_name}_eip_nat"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.app_name}_route_table_public"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}
