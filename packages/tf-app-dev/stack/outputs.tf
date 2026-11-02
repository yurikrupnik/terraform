output "bucket_name" {
  value = module.bucket.name
}

output "topic_id" {
  value = module.topic.id
}

output "subscription_ids" {
  value = module.topic.subscription_id
}
