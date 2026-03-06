resource "aws_cloudwatch_log_group" "ecs_app" {
  name = "/ecs/javapp"
}

resource "aws_cloudwatch_log_group" "ecs_db" {
  name = "/ecs/javadb"
}