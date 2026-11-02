# Pattern 2 · tf-app-dev: the code once (./stack); dev values in terraform.tfvars.
# Prod (tf-app-prod) runs a tagged version of ./stack with its own terraform.tfvars.

# Schema and validation live in ./stack/variables.tf; this only passes the values through.
variable "config" {
  type = any
}

module "app" {
  source = "./stack"

  config = var.config
}
