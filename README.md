# Terraform VPC Module
This module creates a VPC network resource on Google Cloud Platform.
Currently there are no sub-modules available for deploying any other networking resource except VPC.

## Prerequisites
Below prerequisites must be fulfilled for successful execution of terraform concept code sets.

### Software Requirement
Resources in this repository are meant to use with Terraform 1.3.6 (check the terraform version using: `terraform version`). If you don't have the compatible version, download it from official Terraform repository.

- [Terraform](https://www.terraform.io/downloads.html) >= 1.3.6
- [Terraform Provider for GCP](https://github.com/terraform-providers/terraform-provider-google) >= 4.55.0
- [Terraform Provider for GCP Beta](https://github.com/terraform-providers/terraform-provider-google-beta) >= 4.55.0
- [gcloud](https://cloud.google.com/sdk/gcloud/) > 243.0.0

> **Note:**
> See [Installation-Guide](https://gist.github.com/anupam-sy/7458df6506e8e3cfb28c0ff56fab546a) on how to install Terraform.

### API Requirement
In order to deploy the VPC using this module, you must activate the Compute Engine API on the project.

- Compute Engine API - compute.googleapis.com

## Example Usage
```
module "example-vpc" {
  source = "./modules/terraform-gcp-vpc"

  vpc_name                        = "<VPC NAME>"
  project_id                      = "<PROJECT ID>"
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = false
}
```

Then perform the following commands on the root folder:

-   [Required] `terraform init` # To initialize the terraform working directory.
-   [Optional] `terraform validate` # To validate the terraform configuration.
-   [Optional] `terraform fmt` # To format the terraform configuration to a canonical format and style.
-   [Optional] `terraform plan` # To create an execution plan for terraform configuration files.
-   [Required] `terraform apply -auto-approve` # To execute the actions proposed in a terraform plan to create, update, or destroy infrastructure.
-   [Optional] `terraform destroy -auto-approve` # To destroy the created infrastructure. Specific resources can be destroyed using resource targeting.

## Testing
Integration testing for terraform modules can be done using available tools. This terraform module uses Kitchen-Terraform. Kitchen-Terraform integrates Test Kitchen with Terraform, enabling you to write tests using InSpec to validate your infrastructure.

### Tools Requirement
- Kitchen-Terraform: A Test [Kitchen plugin](https://www.rubydoc.info/gems/kitchen-terraform) for Terraform that allows you to test your Terraform configurations.
- Test Kitchen: An integration tool for developing and testing infrastructure code.
- InSpec: A [testing framework](https://docs.chef.io/inspec/) used to write tests to verify the state of your infrastructure.
- Ruby: Kitchen-Terraform and Test Kitchen are Ruby-based, so you’ll need Ruby installed.
- Bundler: A dependency manager for Ruby projects to manage and install the required [gems](https://rubygems.org/).

### Tests Execution
Run kitchen tests commands as per [Test Kitchen](https://kitchen.ci/) workflow to test the terraform modules to esnure that they are working as expected.

- `bundle exec kitchen create` # Initialises terraform state and
- `bundle exec kitchen converge` # Creates the required resources
- `bundle exec kitchen verify` # Tests the created infrastructure
- `bundle exec kitchen destroy` # Destroys the created infrastructure

- `bundle exec kitchen test` # You can club the complete testing lifecycle commands into a single command.
