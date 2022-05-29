<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| [google](https://registry.terraform.io/providers/hashicorp/google/3.87.0) | >= 3.87.0 |

## Providers

| Name | Version |
|------|---------|
| [archive](https://registry.terraform.io/providers/hashicorp/archive/) | n/a |
| [google](https://registry.terraform.io/providers/hashicorp/google/3.87.0) | >= 3.87.0 |

## Resources

| Name | Type |
|------|------|
| [google_cloud_scheduler_job.sql-export-trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_scheduler_job) | resource |
| [google_cloudfunctions_function.sql-export-trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function) | resource |
| [google_project_iam_custom_role.sql-exporter](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_custom_role.storage-access](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_member.sql-export](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_pubsub_topic.sql-export](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic) | resource |
| [google_service_account.cloud-function](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_storage_bucket.source-code-storage](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket.sql-export-storage](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.iam_access](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [google_storage_bucket_object.source-code-storage-object](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |
| [archive_file.source-code](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [google_sql_database_instance.db](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/sql_database_instance) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | n/a | `string` | `"cloud-sql-export"` | no |
| <a name="input_dbs"></a> [dbs](#input\_dbs) | List of databases to export | `list(string)` | n/a | yes |
| <a name="input_enable_offload_export"></a> [enable\_offload\_export](#input\_enable\_offload\_export) | n/a | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment name | `string` | n/a | yes |
| <a name="input_offsite_project"></a> [offsite\_project](#input\_offsite\_project) | Project for keeping sql exprots | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project of Database instance | `string` | n/a | yes |
| <a name="input_scheduler"></a> [scheduler](#input\_scheduler) | n/a | `map(string)` | <pre>{<br>  "cron": "0 23 * * *",<br>  "timezone": "Europe/Berlin"<br>}</pre> | no |
| <a name="input_sql_instance"></a> [sql\_instance](#input\_sql\_instance) | Cloud SQL instance id | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->