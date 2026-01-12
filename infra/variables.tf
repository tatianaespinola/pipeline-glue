variable "region" {
  default = "us-east-1"
}

variable "glue_job_name" {
  default = "glue-job-usuarios-filtrados"
}

variable "script_bucket" {
  description = "Bucket S3 onde o script ETL está armazenado"
}

variable "script_key" {
  default = "etl/usuarios_filtrados_etl.py"
}

variable "glue_role_arn" {
  description = "ARN da role existente usada pelo Glue Job"
}
