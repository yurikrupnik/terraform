# tf-app-dev: the code once (./stack) + dev values. Dev runs the stack from the working copy.
# Prod (packages/tf-app-prod) runs a tagged version of ./stack (tf-app-dev-vX.Y.Z) with prod values.

module "app" {
  source = "./stack"

  project_id              = "dev-project-id"
  region                  = "us-central1"
  environment             = "dev"
  bucket_force_destroy    = true
  bucket_versioning       = false
  topic_message_retention = "86400s"
}
