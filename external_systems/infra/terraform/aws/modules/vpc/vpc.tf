/*==== The VPC ======*/
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  #tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs


  tags = merge(var.tags, {
    Name        = "${var.prefix}-${var.environment}-vpc"
    Environment = var.environment
  })
}

/*==== Subnets ======*/
/* Internet gateway for the public subnet */
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(var.tags, {
    Name        = "${var.prefix}-${var.environment}-igw"
    Environment = var.environment
  })
}

/* Public subnet */
resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnets_cidr)

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.public_subnets_cidr, count.index)
  availability_zone = element(var.availability_zones, (count.index % length(var.availability_zones)))

  #tfsec:ignore:aws-ec2-no-public-ip-subnet
  map_public_ip_on_launch = true
  tags = merge(
    var.public_subnet_tags,
    {
      Name        = "${var.prefix}-${var.environment}-public-subnet-${count.index}"
      Environment = var.environment
    },
    var.tags
  )
}

/* Private subnet */
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  count                   = length(var.private_subnets_cidr)
  cidr_block              = element(var.private_subnets_cidr, count.index)
  availability_zone       = element(var.availability_zones, (count.index % length(var.availability_zones)))
  map_public_ip_on_launch = false
  tags = merge(
    var.private_subnet_tags,
    {
      Name        = "${var.prefix}-${var.environment}-private-subnet-${count.index}"
      Environment = var.environment
    },
    var.tags
  )

}

/* Routing table for private subnet */
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(var.tags, {
    Name        = "${var.prefix}-${var.environment}-private-route-table"
    Environment = var.environment
  })
}

/* Routing table for public subnet */
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(var.tags, {
    Name        = "${var.prefix}-${var.environment}-public-route-table"
    Environment = var.environment
  })
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

/* Route table associations */
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets_cidr)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets_cidr)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private.id
}
