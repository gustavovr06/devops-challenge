resource "aws_ecs_cluster" "eva-tech-cluster" {
    name = "${var.ecs-cluster-name}"
}