# Identical in every env folder. Change values in terraform.tfvars, code in ../../modules/app.

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
  source = "../../modules/app"

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
