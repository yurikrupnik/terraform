# Pattern 2 · tf-app-dev: the code once (./stack); dev values in terraform.tfvars.
# Prod (tf-app-prod) runs a tagged version of ./stack with its own terraform.tfvars.

module "app" {
  source = "./stack"

  config = var.config
}
