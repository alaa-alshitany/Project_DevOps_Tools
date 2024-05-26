resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "redis-subnet-group"
  subnet_ids = [module.network_module.subnets["private_subnet_1"].id, module.network_module.subnets["private_subnet_2"].id]

  tags = {
    Name = "${var.common_resource_name}_Elasticache_Group"
  }
}

resource "aws_elasticache_cluster" "elastic_cluster" {
  cluster_id           = "cluster"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  port                 = 6379
  security_group_ids   = [aws_security_group.redis_sg.id]
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnet_group.name
}
