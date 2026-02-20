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


