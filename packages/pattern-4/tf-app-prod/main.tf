# Pattern 4 · tf-app-prod: runs the shared stack at a pinned landing-zone release; prod values in terraform.tfvars.
# Release / rollback: change ?ref= to another lz-v* tag (one line, approved like any prod change).

module "app" {
  # Real: git::https://bitbucket.org/<workspace>/landing-zone.git//stacks/tf-app?ref=<release>
  source = "git::file:///Users/yurikrupnik/shit/terraform//packages/pattern-4/stacks/tf-app?ref=lz-v1.0.0"

  config = var.config
}
