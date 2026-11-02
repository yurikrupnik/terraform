# Pattern 2 · tf-app-prod: which tested version of tf-app-dev/stack to run; prod values in terraform.tfvars.
# Promote: bump ?ref= to a newer tf-app-dev-v* tag. Rollback: set it back.

module "app" {
  # Real: git::https://bitbucket.org/<workspace>/terraform.git//packages/pattern-2/tf-app-dev/stack?ref=<tag>
  source = "git::file:///Users/yurikrupnik/shit/terraform//packages/pattern-2/tf-app-dev/stack?ref=tf-app-dev-v1.1.1"

  project_id              = var.project_id
  region                  = var.region
  environment             = var.environment
  bucket_force_destroy    = var.bucket_force_destroy
  bucket_versioning       = var.bucket_versioning
  topic_message_retention = var.topic_message_retention
  ack_deadline_seconds    = var.ack_deadline_seconds
}
