output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "private_subnets_id" {
  value = aws_subnet.private_subnet.*.id
}

output "private_subnets" {
  value = aws_subnet.private_subnet
}

output "public_subnets_id" {
  value = aws_subnet.public_subnet.*.id
}

output "public_subnets" {
  value = aws_subnet.private_subnet
}

output "public_subnets_arns" {
  value = aws_subnet.public_subnet.*.arn
}

output "private_subnets_arns" {
  value = aws_subnet.private_subnet.*.arn
}

output "public_route_table" {
  value = aws_route_table.public.id
}

output "private_route_table" {
  value = aws_route_table.private.id
}