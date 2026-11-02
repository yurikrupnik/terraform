variable "config" {
  description = "All settings for one environment of tf-app. Values come from the env's terraform.tfvars."
  type = object({
    project_id              = string # GCP project to deploy into
    region                  = string # bucket location
    environment             = string # "dev" or "prod"; used in names and labels
    bucket_force_destroy    = bool   # allow deleting a non-empty bucket
    bucket_versioning       = bool   # keep previous object versions
    topic_message_retention = string # e.g. "86400s"
    ack_deadline_seconds    = number # subscription ack deadline

    # Optional, dev-only: set it in dev's terraform.tfvars, leave it out in prod -> resource not created.
    scratch_bucket = optional(object({
      delete_after_days = number # objects are deleted automatically after this many days
    }))
  })

  validation {
    condition     = contains(["dev", "prod"], var.config.environment)
    error_message = "config.environment must be \"dev\" or \"prod\"."
  }

  validation {
    condition     = try(var.config.scratch_bucket.delete_after_days >= 1, true)
    error_message = "config.scratch_bucket.delete_after_days must be at least 1."
  }
}
