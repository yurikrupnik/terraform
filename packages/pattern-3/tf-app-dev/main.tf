# Pattern 3 · tf-app-dev: dev values + which tf-app-module version to run. No code here.
# Upgrade: bump ?ref= to a newer tf-app-module-v* tag. Rollback: set it back.

module "app" {
  # Real: git::https://bitbucket.org/<workspace>/terraform.git//packages/pattern-3/tf-app-module?ref=<tag>
  source = "git::file:///Users/yurikrupnik/shit/terraform//packages/pattern-3/tf-app-module?ref=tf-app-module-v1.1.0"

  project_id              = "dev-project-id"
  region                  = "us-central1"
  environment             = "dev"
  bucket_force_destroy    = true
  bucket_versioning       = false
  topic_message_retention = "86400s"
  ack_deadline_seconds    = 20
}
