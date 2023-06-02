resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.aws_ecs_cluster_name # Naming the cluster
}
