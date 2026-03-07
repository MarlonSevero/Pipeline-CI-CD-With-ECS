resource "aws_rds_cluster" "postgresql" {
  cluster_identifier      = "java-db"
  engine                 = "aurora-postgresql"
  engine_mode            = "serverless"
  master_username        = "postgres"
  master_password        = "123456"
  backup_retention_period = 1

  skip_final_snapshot    = true

}

resource "aws_rds_cluster_instance" "postgresql_instance" {
  count              = 1
  identifier         = "java-db-instance"
  cluster_identifier = aws_rds_cluster.postgresql.id
  instance_class     = "db.t3.micro"
  engine            = aws_rds_cluster.postgresql.engine
  engine_version    = "13.6"
  depends_on = [aws_rds_cluster.postgresql]
  # allocated_storage = 5 #GB
  # max_allocated_storage = 10 #GB
  # storage_encrypted = true
  # storage_type = "gp2"
  # iam_database_authentication_enabled = true
  # iam_roles = [aws_iam_role.rds_access_role.arn]
  
}

resource "null_resource" "init_db" {
  depends_on = [aws_rds_cluster_instance.postgresql_instance]
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = "PGPASSWORD=123456 psql -h ${aws_rds_cluster.postgresql.endpoint} -U postgres -d FIAP -f scriptPostgreSQL.sql"
  }
}