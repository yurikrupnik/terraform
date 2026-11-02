terraform {
  required_version = ">= 1.12.2"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 8.6.0, < 9.0.0" # matches the Fabric release below
    }
  }
}

locals {
  labels = {
    app         = "tf-app"
    environment = var.config.environment
  }
}

# Building blocks: Cloud Foundation Fabric modules, one Fabric release for the whole stack.
# Bumping Fabric is a normal stack change: dev picks it up, prod gets it with the next tag.

module "bucket" {
  source = "github.com/GoogleCloudPlatform/cloud-foundation-fabric//modules/gcs?ref=v59.2.0"

  project_id    = var.config.project_id
  prefix        = var.config.project_id
  name          = "tf-app-${var.config.environment}"
  location      = var.config.region
  versioning    = var.config.bucket_versioning
  force_destroy = var.config.bucket_force_destroy
  labels        = local.labels
}

module "topic" {
  source = "github.com/GoogleCloudPlatform/cloud-foundation-fabric//modules/pubsub?ref=v59.2.0"

  project_id                 = var.config.project_id
  name                       = "tf-app-${var.config.environment}"
  message_retention_duration = var.config.topic_message_retention
  labels                     = local.labels

  subscriptions = {
    "tf-app-${var.config.environment}" = {
      ack_deadline_seconds = var.config.ack_deadline_seconds
    }
  }
}
