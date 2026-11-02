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
  })

  validation {
    condition     = contains(["dev", "prod"], var.config.environment)
    error_message = "config.environment must be \"dev\" or \"prod\"."
  }
}
