resource "aws_ecs_service" "javapp" {
  name            = "javaapp"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.javapp.arn
  launch_type     = "FARGATE"
  desired_count   = 1
  enable_execute_command = true

  network_configuration {
    subnets       = [
      data.aws_subnet.main-public-subnet-1a.id,
      data.aws_subnet.main-public-subnet-1b.id
    ]
      security_groups  = [data.aws_security_group.sg_http.id]
      assign_public_ip = true
  }
}

resource "aws_ecs_service" "javadb" {
  name            = "javadb"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.javadb.arn
  launch_type     = "FARGATE"
  desired_count   = 1
  enable_execute_command = true

  network_configuration {
    subnets       = [
      data.aws_subnet.main-public-subnet-1a.id,
      data.aws_subnet.main-public-subnet-1b.id
    ]
      security_groups  = [data.aws_security_group.sg_http.id]
  }
}