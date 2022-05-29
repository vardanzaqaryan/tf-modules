data "google_sql_database_instance" "db" {
  name = var.sql_instance
}

resource "google_service_account" "cloud-function" {
  account_id   = "sql-exporter-sa"
  display_name = "SA for sql-exporter cloud function"
}

resource "google_project_iam_custom_role" "sql-exporter" {
  title   = "Cloud SQL Exporter"
  role_id = "sql.exporter"
  permissions = [
    "cloudsql.instances.export"
  ]
}

resource "google_project_iam_member" "sql-export" {
  role   = google_project_iam_custom_role.sql-exporter.id
  member = "serviceAccount:${google_service_account.cloud-function.email}"

  depends_on = [
    google_service_account.cloud-function,
    google_project_iam_custom_role.sql-exporter
  ]
}

resource "google_project_iam_custom_role" "storage-access" {
  project = var.offsite_project
  title   = "Role for accessing from ${var.project} project to cloud storege"
  role_id = "${var.env}.cloudstorage"
  permissions = [
    "storage.objects.get",
    "storage.objects.create"
  ]
}
