ecs_cluster_name    = "your-existing-cluster-name"
task_role_arn       = "arn:aws:iam::811738710312:role/ecs_fargate_taskRole"
ecr_image_url       = "811738710312.dkr.ecr.us-east-1.amazonaws.com/strapi-repo:latest"
subnet_ids          = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]
security_group_ids  = ["sg-xxxxxxxx"]
