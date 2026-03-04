resource "aws_iam_role" "ecs_task_execution" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_cluster" "main" {
  name = "severo-cluster"
}

resource "aws_ecs_task_definition" "javapp" {
  family                   = "javapp"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn
  task_role_arn            = aws_iam_role.ecs_task_execution.arn              

    
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = jsonencode([
    {
      name      = "javapp"
      image     = "marlonsevero/javapp:1.0.0"
      essential = true
      portMappings = [
            {
                containerPort = 8080
                //protocol = TCP
                }
            ]
        }
  ])
}

resource "aws_ecs_service" "javapp" {
  name            = "javaapp"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.javapp.arn
  launch_type     = "FARGATE"
  desired_count   = 1
  enable_execute_command = true

  network_configuration {
    subnets         = [
      //data.aws_subnet.main-private-subnet-1a.id,
      //data.aws_subnet.main-private-subnet-1b.id,
      data.aws_subnet.main-public-subnet-1a.id,
      data.aws_subnet.main-public-subnet-1b.id
    ]
      assign_public_ip = true
  }
}


