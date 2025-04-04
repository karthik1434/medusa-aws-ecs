resource "aws_ecs_cluster" "medusa_cluster" {}

resource "aws_ecs_task_definition" "medusa_task" {
  family                   = "medusa-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"

  container_definitions = jsonencode([
    {
      name      = "medusa"
      image     = "your-ecr-repo-url:latest"
      cpu       = 512
      memory    = 1024
      essential = true
      portMappings = [{ containerPort = 9000, hostPort = 9000 }]
    }
  ])
}

resource "aws_ecs_service" "medusa_service" {
  name            = "medusa-service"
  cluster         = aws_ecs_cluster.medusa_cluster.id
  task_definition = aws_ecs_task_definition.medusa_task.arn
  launch_type     = "FARGATE"
}
