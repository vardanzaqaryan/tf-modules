data "archive_file" "source-code" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "${path.module}/target/function.zip"
}

resource "google_storage_bucket" "source-code-storage" {
  name     = "sql-exporter-bucket"
  location = "EU"
}
resource "google_storage_bucket_object" "source-code-storage-object" {
  name   = "function.zip"
  bucket = google_storage_bucket.source-code-storage.name
  source = "${path.module}/target/function.zip"

  depends_on = [
    data.archive_file.source-code
  ]
}

resource "google_cloudfunctions_function" "sql-export-trigger" {
  name        = "sql-exporter"
  description = "Function to trigger a SQL export operation"

  timeout               = 90
  runtime               = "python38"
  entry_point           = "main"
  available_memory_mb   = 256
  service_account_email = google_service_account.cloud-function.email
  source_archive_bucket = google_storage_bucket.source-code-storage.name
  source_archive_object = google_storage_bucket_object.source-code-storage-object.name

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_pubsub_topic.sql-export.id
  }
}