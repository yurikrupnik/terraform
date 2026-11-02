# Pattern 2 · tf-app-prod: which tested version of tf-app-dev/stack to run; prod values in terraform.tfvars.
# Promote: bump ?ref= to a newer tf-app-dev-v* tag. Rollback: set it back.

# Schema and validation live in the stack (tf-app-dev/stack/variables.tf); this only passes the values through.
variable "config" {
  type = any
}

module "app" {
  # Real: git::https://bitbucket.org/<workspace>/terraform.git//packages/pattern-2/tf-app-dev/stack?ref=<tag>
  source = "git::file:///Users/yurikrupnik/shit/terraform//packages/pattern-2/tf-app-dev/stack?ref=tf-app-dev-v2.0.0"

  config = var.config
}
