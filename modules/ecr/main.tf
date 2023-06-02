resource "aws_ecr_repository" "ecr_repository" {
  name         = var.aws_ecr_repository_name
  force_delete = true
}
