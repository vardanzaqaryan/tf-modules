variable "env" {
  type        = string
  description = "Environment name"
}
variable "project" {
  type        = string
  description = "Project of Database instance"
}

variable "offsite_project" {
  type        = string
  description = "Project for keeping sql exprots"
}

variable "sql_instance" {
  type        = string
  description = "Cloud SQL instance id"
}

variable "dbs" {
  type        = list(string)
  description = "List of databases to export"
}

variable "enable_offload_export" {
  type    = bool
  default = true
}

variable "bucket_name" {
  type    = string
  default = "cloud-sql-export"
}

variable "scheduler" {
  type = map(string)
  default = {
    cron     = "0 23 * * *"
    timezone = "Europe/Berlin"
  }
}