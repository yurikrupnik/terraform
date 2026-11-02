terraform {
  required_version = ">= 1.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

locals {
  labels = {
    app         = "tf-app"
    environment = var.environment
  }
}

resource "google_storage_bucket" "this" {
  project                     = var.project_id
  name                        = "${var.project_id}-tf-app-${var.environment}"
  location                    = var.region
  force_destroy               = var.bucket_force_destroy
  uniform_bucket_level_access = true
  labels                      = local.labels

  versioning {
    enabled = var.bucket_versioning
  }
}

resource "google_pubsub_topic" "this" {
  project                    = var.project_id
  name                       = "tf-app-${var.environment}"
  message_retention_duration = var.topic_message_retention
  labels                     = local.labels
}
