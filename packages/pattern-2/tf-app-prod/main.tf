# Pattern 2 · tf-app-prod: which tested version of tf-app-dev/stack to run; prod values in terraform.tfvars.
# Promote: bump ?ref= to a newer tf-app-dev-v* tag. Rollback: set it back.

module "app" {
  # Real: git::https://bitbucket.org/<workspace>/tf-app-dev.git//stack?ref=<tag>
  source = "git::file:///Users/yurikrupnik/shit/terraform//packages/pattern-2/tf-app-dev/stack?ref=tf-app-dev-v2.1.0"

  config = var.config
}
