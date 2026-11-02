# Pattern 2 · tf-app-dev: the code once (./stack); dev values in terraform.tfvars.
# Prod (packages/pattern-2/tf-app-prod) runs a tagged version of ./stack (tf-app-dev-vX.Y.Z) with prod values.

module "app" {
  source = "./stack"

  project_id              = var.project_id
  region                  = var.region
  environment             = var.environment
  bucket_force_destroy    = var.bucket_force_destroy
  bucket_versioning       = var.bucket_versioning
  topic_message_retention = var.topic_message_retention
  ack_deadline_seconds    = var.ack_deadline_seconds
}
