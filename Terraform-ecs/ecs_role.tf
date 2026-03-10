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

resource "aws_iam_role" "rds_access_role" {
  name = "rdsAccessRole"

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

resource "aws_iam_policy" "rds_access_policy" {
  name        = "rdsAccessPolicy"
  description = "Allow ECS Tasks to connect and manage RDS clusters"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "rds:DescribeDBClusters",
          "rds:DescribeDBInstances",
          "rds:DescribeDBClusterEndpoints",
          "rds:DescribeDBSubnetGroups",
          "rds:ListTagsForResource",
          "rds:DescribeDBClusterParameters",
          "rds:DescribeDBEngineVersions",
          "rds:DescribeDBParameterGroups",
          "rds:DescribeDBSecurityGroups",
          "rds:DescribeDBSnapshots",
          "rds:DescribeEventSubscriptions",
          "rds:DescribeEvents",
          "rds:DescribeOrderableDBInstanceOptions",
          "rds:DescribeReservedDBInstances",
          "rds:DescribeSourceRegions",
          "secretsmanager:GetSecretValue",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "rds_access_policy_attachment" {
  role       = aws_iam_role.rds_access_role.name
  policy_arn = aws_iam_policy.rds_access_policy.arn
}
