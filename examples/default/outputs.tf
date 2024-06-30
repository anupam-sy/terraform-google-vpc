# Output values of VPC network resource
output "network_name" {
  value       = module.default.network_name
  description = "The name of the VPC being created"
}

output "network_id" {
  value       = module.default.network_id
  description = "The ID of the VPC being created"
}
