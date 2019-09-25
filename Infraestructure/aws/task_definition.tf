
resource "aws_ecs_task_definition" "app-node-1" {
    family                = "app-node-1"
    container_definitions = "${file("./ecs/task-definition.json")}"
}