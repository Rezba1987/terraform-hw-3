resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 2
  identifier         = "aurora-cluster-hw-${count.index}"
  cluster_identifier = aws_rds_cluster.rds-cluster-aurora.id
  instance_class     = "db.r4.large"
  availability_zone = "us-east-1a"
  engine             = aws_rds_cluster.rds-cluster-aurora.engine
  engine_version     = aws_rds_cluster.rds-cluster-aurora.engine_version
  tags               = var.common_tags
}

resource "aws_rds_cluster" "rds-cluster-aurora" {
  cluster_identifier     = "example"
  availability_zones     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  engine                 = "aurora-mysql"
  engine_version         = "5.7.mysql_aurora.2.10.2"
  port                   = "3306"
  master_username        = "test"
  master_password        = "mustbeeightcharaters"



  tags = var.common_tags
}
