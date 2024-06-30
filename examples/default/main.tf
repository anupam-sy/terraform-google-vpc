# Module block to deploy VPC Network
module "default" {
  source = "../.."

  vpc_name                        = var.vpc_name
  description                     = var.description
  project_id                      = var.project_id
  routing_mode                    = var.routing_mode
  auto_create_subnetworks         = var.auto_create_subnetworks
  delete_default_routes_on_create = var.delete_default_routes_on_create
}
