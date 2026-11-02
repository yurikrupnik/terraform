output "bucket_name" {
  value = module.bucket.name
}

output "topic_id" {
  value = module.topic.id
}

output "subscription_ids" {
  value = module.topic.subscription_id
}

output "scratch_bucket_name" {
  description = "Null where config.scratch_bucket is not set (prod)."
  value       = one(module.scratch_bucket[*].name)
}
