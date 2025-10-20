# Cloud NGFW Data
data "cloudngfwaws_ngfw" "kayana_prod_cngfw" {
  name       = var.cngfw_name
  account_id = var.aws_account
}

# Create security subnets for Cloud NGFW Endpoints
resource "aws_subnet" "sec_sub_a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.sec_sub_a_cidr
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = "sec-subnet-a"
  }
}

resource "aws_subnet" "sec_sub_b" {
  vpc_id            = var.vpc_id
  cidr_block        = var.sec_sub_b_cidr
  availability_zone = "${var.aws_region}b"
  tags = {
    Name = "sec-subnet-b"
  }
}

resource "aws_subnet" "sec_sub_c" {
  vpc_id            = var.vpc_id
  cidr_block        = var.sec_sub_c_cidr
  availability_zone = "${var.aws_region}c"
  tags = {
    Name = "sec-subnet-c"
  }
}

resource "aws_route_table" "sec_rt_a" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.natgw_a_id
  }
  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id = var.tgw_id
  }

  tags = {
    Name = "sec-route-table-a"
  }
}

resource "aws_route_table" "sec_rt_b" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.natgw_b_id
  }
  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id = var.tgw_id
  }

  tags = {
    Name = "sec-route-table-b"
  }
}

resource "aws_route_table" "sec_rt_c" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.natgw_c_id
  }
  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id = var.tgw_id
  }

  tags = {
    Name = "sec-route-table-c"
  }
}

resource "aws_route_table_association" "sec_rt_assoc_a" {
  subnet_id      = aws_subnet.sec_sub_a.id
  route_table_id = aws_route_table.sec_rt_a.id
}

resource "aws_route_table_association" "sec_rt_assoc_b" {
  subnet_id      = aws_subnet.sec_sub_b.id
  route_table_id = aws_route_table.sec_rt_b.id
}

resource "aws_route_table_association" "sec_rt_assoc_c" {
  subnet_id      = aws_subnet.sec_sub_c.id
  route_table_id = aws_route_table.sec_rt_c.id
}

# Create Cloud NGFW Endpoints
resource "aws_vpc_endpoint" "kayana_cngfw_ep_a" {
  vpc_id            = var.vpc_id
  service_name      = data.cloudngfwaws_ngfw.kayana_prod_cngfw.endpoint_service_name
  vpc_endpoint_type = "GatewayLoadBalancer"

  subnet_ids = [aws_subnet.sec_sub_a.id]

  tags = {
    Name = "cngfw_ep_a"
  }
}

resource "aws_vpc_endpoint" "kayana_cngfw_ep_b" {
  vpc_id            = var.vpc_id
  service_name      = data.cloudngfwaws_ngfw.kayana_prod_cngfw.endpoint_service_name
  vpc_endpoint_type = "GatewayLoadBalancer"

  subnet_ids = [aws_subnet.sec_sub_b.id]

  tags = {
    Name = "cngfw_ep_b"
  }
}

resource "aws_vpc_endpoint" "kayana_cngfw_ep_c" {
  vpc_id            = var.vpc_id
  service_name      = data.cloudngfwaws_ngfw.kayana_prod_cngfw.endpoint_service_name
  vpc_endpoint_type = "GatewayLoadBalancer"

  subnet_ids = [aws_subnet.sec_sub_c.id]

  tags = {
    Name = "cngfw_ep_c"
  }
}