# Import existing VPC routes
import {
  to = aws_route.def_rt_tgw_sub_a
  id = "${var.tgw_route_table_a_id}_0.0.0.0/0"
}

import {
  to = aws_route.def_rt_tgw_sub_b
  id = "${var.tgw_route_table_b_id}_0.0.0.0/0"
}

import {
  to = aws_route.def_rt_tgw_sub_c
  id = "${var.tgw_route_table_c_id}_0.0.0.0/0"
}

import {
  to = aws_route.natgw_to_kayana_a
  id = "${var.natgw_route_table_a_id}_10.0.0.0/8"
}

import {
  to = aws_route.natgw_to_kayana_b
  id = "${var.natgw_route_table_b_id}_10.0.0.0/8"
}

import {
  to = aws_route.natgw_to_kayana_c
  id = "${var.natgw_route_table_c_id}_10.0.0.0/8"
}

# Modify tgw subnets default route via Cloud NGFW Endpoints
resource "aws_route" "def_rt_tgw_sub_a" {
  route_table_id         = var.tgw_route_table_a_id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = local.kayana_cngfw_ep_a
}

resource "aws_route" "def_rt_tgw_sub_b" {
  route_table_id         = var.tgw_route_table_b_id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = local.kayana_cngfw_ep_b
}

resource "aws_route" "def_rt_tgw_sub_c" {
  route_table_id         = var.tgw_route_table_c_id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = local.kayana_cngfw_ep_c
}

# Modify natgw subnet return route to Kayana VPCs via Cloud NGFW Endpoints
resource "aws_route" "natgw_to_kayana_a" {
  route_table_id         = var.natgw_route_table_a_id
  destination_cidr_block = "10.0.0.0/8"
  vpc_endpoint_id        = local.kayana_cngfw_ep_a
}

resource "aws_route" "natgw_to_kayana_b" {
  route_table_id         = var.natgw_route_table_b_id
  destination_cidr_block = "10.0.0.0/8"
  vpc_endpoint_id        = local.kayana_cngfw_ep_b
}

resource "aws_route" "natgw_to_kayana_c" {
  route_table_id         = var.natgw_route_table_c_id
  destination_cidr_block = "10.0.0.0/8"
  vpc_endpoint_id        = local.kayana_cngfw_ep_c
}