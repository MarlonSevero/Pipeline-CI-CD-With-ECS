
# 1. Define the Private DNS Namespace
resource "aws_service_discovery_private_dns_namespace" "severo_online" {
  name        = "severo.local"
  description = "Private DNS namespace for services"
  vpc         =  data.aws_vpc.main-project-vpc.id
}

# 2. Create a Service Registry
resource "aws_service_discovery_service" "javadb" {
  name = "javadb" #javadb.severo.local
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.severo_online.id
    dns_records {
      ttl  = 10
      type = "A"
    }
  }
}

resource "aws_service_discovery_service" "javapp" {
  name = "javapp"
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.severo_online.id
    dns_records {
      ttl  = 10
      type = "A"
    }
  }
}


resource "aws_ecs_service" "javaapp" {
  name            = "javapp"
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
    service_registries {
      registry_arn   = aws_service_discovery_service.javapp.arn
      container_name = "javapp" # Must match task_definition
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
      assign_public_ip = true
  }

  service_registries {
    registry_arn   = aws_service_discovery_service.javadb.arn
    container_name = "javadb"
  }
}