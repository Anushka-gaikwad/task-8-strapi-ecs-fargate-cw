########################################
# USE DEFAULT VPC
########################################

data "aws_vpc" "selected" {
  id = "vpc-0295253d470704295"
}

########################################
# GET DEFAULT SUBNETS
########################################

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

########################################
# SECURITY GROUP FOR ECS
########################################

resource "aws_security_group" "ecs_sg" {
  name   = "sejal-ecs-sg"
  vpc_id = data.aws_vpc.selected.id

  ingress {
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
