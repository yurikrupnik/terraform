# Dev values for ./stack (dev runs the stack directly: terraform -chdir=stack plan -var-file=../terraform.tfvars).
config = {
  project_id              = "dev-project-id"
  region                  = "us-central1"
  environment             = "dev"
  bucket_force_destroy    = true
  bucket_versioning       = false
  topic_message_retention = "86400s"
  ack_deadline_seconds    = 20
}
