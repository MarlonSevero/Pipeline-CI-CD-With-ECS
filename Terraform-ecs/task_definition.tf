resource "aws_ecs_task_definition" "javapp" {
  family                   = "javapp"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn
  task_role_arn            = aws_iam_role.ecs_task_execution.arn              

    
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = jsonencode([
    {
      name      = "javapp"
      image     = "marlonsevero/java-app:v1.0.1"
      essential = true
      portMappings = [
            {
                containerPort = 8080
                }
            ]
      logConfiguration = {
        logDriver = "awslogs"
          options = {
          awslogs-group         = "/ecs/javapp"
          awslogs-region        = "us-east-1"
          awslogs-stream-prefix = "ecs_app"
          }
        }  
      } 
  ])
}


resource "aws_ecs_task_definition" "javadb" {
  family                   = "javadb"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn
  task_role_arn            = aws_iam_role.ecs_task_execution.arn
  depends_on = [aws_cloudwatch_log_group.ecs_db]
    
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = jsonencode([
    {
      name      = "javadb"
      image     = "marlonsevero/java-db:v1.0.1"
      essential = true
      portMappings = [
            {
                containerPort = 5432
                }
            ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/javadb"
          awslogs-region        = "us-east-1"
          awslogs-stream-prefix = "ecs_db"
        }
      }  
    } 
  ])
}



