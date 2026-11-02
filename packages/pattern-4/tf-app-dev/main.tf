# Pattern 4 · tf-app-dev: runs the shared stack from this commit (latest); dev values in terraform.tfvars.
# Prod (tf-app-prod, same repo) runs the same stack at a pinned landing-zone release.

module "app" {
  source = "../stacks/tf-app"

  config = var.config
}
