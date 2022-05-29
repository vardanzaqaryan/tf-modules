resource "google_pubsub_topic" "sql-export" {
  name = "sql-export"
}

resource "google_cloud_scheduler_job" "sql-export-trigger" {
  name      = "sql-export-trigger"
  schedule  = var.scheduler.cron
  time_zone = var.scheduler.timezone

  pubsub_target {
    topic_name = google_pubsub_topic.sql-export.id
    data       = base64encode(local.scheduler_data)
  }
}