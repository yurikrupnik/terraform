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

    # Optional, dev-only: set it in dev's terraform.tfvars; prod is rejected by the validation below.
    scratch_bucket = optional(object({
      delete_after_days = number # objects are deleted automatically after this many days
    }))
  })

  # All validation blocks must pass; a failing one stops plan/apply before anything is created.

  # environment is used in resource names and labels, so only known values are allowed.
  validation {
    condition     = contains(["dev", "prod"], var.config.environment)
    error_message = "config.environment must be \"dev\" or \"prod\"."
  }

  # Policy: scratch_bucket is dev-only. Fails the prod plan if it is set by any route: prod's
  # terraform.tfvars, a TFE workspace variable, or a future default in this stack.
  # Allowing it in prod means removing this block in a new stack release (reviewed like any code change).
  validation {
    condition     = var.config.environment != "prod" || var.config.scratch_bucket == null
    error_message = "scratch_bucket is dev-only and cannot be enabled in prod."
  }

  # Sanity: wherever scratch_bucket is set, objects must live at least 1 day.
  # When scratch_bucket is null the left side is true and the right side is never read
  # (reading .delete_after_days from null would be an error).
  validation {
    condition     = var.config.scratch_bucket == null || var.config.scratch_bucket.delete_after_days >= 1
    error_message = "config.scratch_bucket.delete_after_days must be at least 1."
  }
}
