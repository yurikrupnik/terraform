# Pattern 3 · tf-app-prod: prod values + which tf-app-module version to run. No code here.
# Upgrade: bump ?ref= to a newer tf-app-module-v* tag. Rollback: set it back.

module "app" {
  # Real: git::https://bitbucket.org/<workspace>/terraform.git//packages/pattern-3/tf-app-module?ref=<tag>
  source = "git::file:///Users/yurikrupnik/shit/terraform//packages/pattern-3/tf-app-module?ref=tf-app-module-v1.0.0"

  project_id              = "prod-project-id"
  region                  = "us-central1"
  environment             = "prod"
  bucket_force_destroy    = false
  bucket_versioning       = true
  topic_message_retention = "604800s"
}
