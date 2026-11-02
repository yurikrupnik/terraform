# tf-app-prod: prod values + which tested version of tf-app-dev/stack to run.
# Promote: bump ?ref= to a newer tf-app-dev-v* tag. Rollback: set it back.

module "app" {
  # Real: git::https://bitbucket.org/<workspace>/terraform.git//packages/tf-app-dev/stack?ref=<tag>
  source = "git::file:///Users/yurikrupnik/shit/terraform//packages/tf-app-dev/stack?ref=tf-app-dev-v1.0.0"

  project_id              = "prod-project-id"
  region                  = "us-central1"
  environment             = "prod"
  bucket_force_destroy    = false
  bucket_versioning       = true
  topic_message_retention = "604800s"
}
