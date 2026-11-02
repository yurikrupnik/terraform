output "bucket_name" {
  value = google_storage_bucket.this.name
}

output "topic_id" {
  value = google_pubsub_topic.this.id
}
