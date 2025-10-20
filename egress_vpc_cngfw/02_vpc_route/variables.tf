# Build path to Cloud NGFW Endpoints' Terraform state
data "terraform_remote_state" "cloudngfw_endpoints" {
  backend = "local"
  config = {
    path = "../01_cloudngfw_endpoints/terraform.tfstate"
  }
}

# Locals - values retrieved from previous Terraform deployment, using the deployment's state as declared above
locals {
  aws_region        = data.terraform_remote_state.cloudngfw_endpoints.outputs.aws_region
  kayana_cngfw_ep_a = data.terraform_remote_state.cloudngfw_endpoints.outputs.kayana_cngfw_ep_a
  kayana_cngfw_ep_b = data.terraform_remote_state.cloudngfw_endpoints.outputs.kayana_cngfw_ep_b
  kayana_cngfw_ep_c = data.terraform_remote_state.cloudngfw_endpoints.outputs.kayana_cngfw_ep_c
}

# Variables for VPC Route configuration
variable "tgw_route_table_a_id" {
  type = string
}

variable "tgw_route_table_b_id" {
  type = string
}

variable "tgw_route_table_c_id" {
  type = string
}

variable "natgw_route_table_a_id" {
  type = string
}

variable "natgw_route_table_b_id" {
  type = string
}

variable "natgw_route_table_c_id" {
  type = string
}