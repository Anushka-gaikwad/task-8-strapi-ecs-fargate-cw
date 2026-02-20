resource "aws_cloudwatch_log_group" "strapi" {
  name              = "/ecs/strapi"
  retention_in_days = 7
}

# CloudWatch Dashboard for ECS metrics
resource "aws_cloudwatch_dashboard" "ecs_dashboard" {
  dashboard_name = "ECS-Strapi-Dashboard"
  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric"
        x = 0
        y = 0
        width = 6
        height = 6
        properties = {
          metrics = [
            ["AWS/ECS","CPUUtilization","ClusterName",var.ecs_cluster_name],
            ["AWS/ECS","MemoryUtilization","ClusterName",var.ecs_cluster_name],
            ["AWS/ECS","RunningTaskCount","ClusterName",var.ecs_cluster_name],
            ["AWS/ECS","NetworkBytesIn","ClusterName",var.ecs_cluster_name],
            ["AWS/ECS","NetworkBytesOut","ClusterName",var.ecs_cluster_name]
          ]
          period = 300
          stat = "Average"
          region = "us-east-1"
          title = "ECS Strapi Service Metrics"
        }
      }
    ]
  })
}
