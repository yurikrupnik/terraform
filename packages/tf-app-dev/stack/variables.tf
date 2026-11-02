variable "project_id" {
  description = "GCP project to deploy into."
  type        = string
}

variable "region" {
  description = "Location for the bucket."
  type        = string
}

variable "environment" {
  description = "Environment name; used in resource names and labels."
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "environment must be \"dev\" or \"prod\"."
  }
}

variable "bucket_force_destroy" {
  description = "Allow deleting the bucket while it still contains objects."
  type        = bool
}

variable "bucket_versioning" {
  description = "Keep previous object versions."
  type        = bool
}

variable "topic_message_retention" {
  description = "How long the topic retains published messages (e.g. \"86400s\")."
  type        = string
}
