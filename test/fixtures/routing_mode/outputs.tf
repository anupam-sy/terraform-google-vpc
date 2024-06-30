# Output values of VPC network resource
output "network_name" {
  value       = module.custom_vpc.network_name
  description = "The name of the VPC being created"
}

output "network_id" {
  value       = module.custom_vpc.network_id
  description = "The ID of the VPC being created"
}
