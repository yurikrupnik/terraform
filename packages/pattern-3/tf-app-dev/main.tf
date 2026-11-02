# Pattern 3 · tf-app-dev: which tf-app-module version to run; dev values in terraform.tfvars. No code here.
# Upgrade: bump ?ref= to a newer tf-app-module-v* tag. Rollback: set it back.

module "app" {
  # Real: git::https://bitbucket.org/<workspace>/terraform.git//packages/pattern-3/tf-app-module?ref=<tag>
  source = "git::file:///Users/yurikrupnik/shit/terraform//packages/pattern-3/tf-app-module?ref=tf-app-module-v1.1.0"

  project_id              = var.project_id
  region                  = var.region
  environment             = var.environment
  bucket_force_destroy    = var.bucket_force_destroy
  bucket_versioning       = var.bucket_versioning
  topic_message_retention = var.topic_message_retention
  ack_deadline_seconds    = var.ack_deadline_seconds
}
