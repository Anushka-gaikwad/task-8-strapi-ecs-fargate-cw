output "task_definition_arn" {
  value = aws_ecs_task_definition.strapi.arn
}

output "ecs_service_name" {
  value = aws_ecs_service.strapi.name
}

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.strapi.name
}

output "cloudwatch_dashboard" {
  value = aws_cloudwatch_dashboard.ecs_dashboard.dashboard_name
}
