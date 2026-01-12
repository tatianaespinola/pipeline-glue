resource "aws_glue_job" "this" {
  name     = var.glue_job_name
  role_arn = var.glue_role_arn

  glue_version       = "4.0"
  number_of_workers  = 2
  worker_type        = "G.1X"

  command {
    name            = "glueetl"
    python_version  = "3"
    script_location = "s3://${var.script_bucket}/${var.script_key}"
  }

  default_arguments = {
    "--job-language" = "python"
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-metrics"                  = ""
    "--database"                        = "database_engenharia_de_dados"
    "--tabela_origem"                   = "usuarios"
    "--tabela_destino"                  = "usuarios_filtrados"
  }
}
