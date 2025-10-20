output "aws_region" {
  value = var.aws_region
}

output "kayana_cngfw_ep_a" {
  value = aws_vpc_endpoint.kayana_cngfw_ep_a.id
}

output "kayana_cngfw_ep_b" {
  value = aws_vpc_endpoint.kayana_cngfw_ep_b.id
}

output "kayana_cngfw_ep_c" {
  value = aws_vpc_endpoint.kayana_cngfw_ep_c.id
}