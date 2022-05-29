resource "google_storage_bucket" "sql-export-storage" {
  project = var.offsite_project

  name                        = var.bucket_name
  location                    = "EUROPE-WEST2"
  storage_class               = "COLDLINE"
  uniform_bucket_level_access = true

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 151
    }
  }

  retention_policy {
    retention_period = 12960000 ## 150 days
  }
}

resource "google_storage_bucket_iam_member" "iam_access" {
  bucket = google_storage_bucket.sql-export-storage.id
  role = google_project_iam_custom_role.storage-access.id
  member = "serviceAccount:${data.google_sql_database_instance.db.service_account_email_address}"
}