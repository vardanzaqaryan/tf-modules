locals {
  scheduler_data = jsonencode(
    {
      "db" : "${var.dbs}",
      "offload" : "${var.enable_offload_export}",
      "instance" : "${var.sql_instance}",
      "currentProject" : "${var.project}",
      "gs" : "${google_storage_bucket.sql-export-storage.url}"
    }
  )
}