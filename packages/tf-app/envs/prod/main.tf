# Prod pins the module to a release tag; dev uses the working copy (../../modules/app).
# Promote: bump ?ref= to a newer tf-app-v* tag after dev is green.

variable "project_id" { type = string }
variable "region" { type = string }
variable "environment" { type = string }
variable "bucket_force_destroy" { type = bool }
variable "bucket_versioning" { type = bool }
variable "topic_message_retention" { type = string }

provider "google" {
  project = var.project_id
  region  = var.region
}

module "app" {
  # Local demo (no remote). With GitHub this would be:
  # git::https://github.com/<org>/terraform.git//packages/tf-app/modules/app?ref=<tag>
  source = "git::file:///Users/yurikrupnik/shit/terraform//packages/tf-app/modules/app?ref=tf-app-v2.0.0"

  project_id              = var.project_id
  region                  = var.region
  environment             = var.environment
  bucket_force_destroy    = var.bucket_force_destroy
  bucket_versioning       = var.bucket_versioning
  topic_message_retention = var.topic_message_retention
}

output "bucket_name" {
  value = module.app.bucket_name
}

output "topic_id" {
  value = module.app.topic_id
}
