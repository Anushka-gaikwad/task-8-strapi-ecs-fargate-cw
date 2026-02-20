variable "ecs_cluster_name" {
  description = "Existing ECS cluster name"
  type        = string
}

variable "task_role_arn" {
  description = "Existing ECS task IAM role ARN"
  type        = string
}

variable "ecr_image_url" {
  description = "Existing ECR image URL"
  type        = string
}

variable "subnet_ids" {
  description = "List of existing subnet IDs"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of existing security group IDs"
  type        = list(string)
}
