config = {
  project_id              = "dev-project-id"
  region                  = "us-central1"
  environment             = "dev"
  bucket_force_destroy    = true
  bucket_versioning       = false
  topic_message_retention = "86400s"
  ack_deadline_seconds    = 20

  # dev-only resource; prod leaves this out
  scratch_bucket = {
    delete_after_days = 7
  }
}
