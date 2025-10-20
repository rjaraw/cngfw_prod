variable "aws_region" {
  description = "The AWS region to deploy the resources in."
  type        = string
}

variable "aws_account" {
  description = "AWS Account"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the endpoints will be created."
  type        = string
}

variable "cngfw_name" {
  description = "The name of the Cloud NGFW instance."
  type        = string
}

variable "sec_sub_a_cidr" {
  description = "The ID of the subnet for endpoint A."
  type        = string
}

variable "sec_sub_b_cidr" {
  description = "The ID of the subnet for endpoint B."
  type        = string
}

variable "sec_sub_c_cidr" {
  description = "The ID of the subnet for endpoint C."
  type        = string
}

variable "tgw_id" {
  description = "The ID of the Transit Gateway."
  type        = string
}

variable "natgw_a_id" {
  description = "The ID of the NAT Gateway A."
  type        = string
}

variable "natgw_b_id" {
  description = "The ID of the NAT Gateway B."
  type        = string
}

variable "natgw_c_id" {
  description = "The ID of the NAT Gateway C."
  type        = string
}