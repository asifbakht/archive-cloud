# resource "aws_secretsmanager_secret" "mysql_creds" {
#   name                    = "${var.aws_secrets_manager_name}-rds-4"
#   description             = "RDS database app_user credentials for the MySQLExecutor Lambda"
#   recovery_window_in_days = 7
# }
