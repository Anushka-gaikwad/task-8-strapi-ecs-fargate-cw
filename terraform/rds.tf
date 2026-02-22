resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "anushka-db-subnet-group"
  subnet_ids = [
  "subnet-0537457522152aa2d",
  "subnet-0fbd6ace1bb63c1c1"
]
}

resource "aws_security_group" "rds_sg" {
  name        = "anushka-rds-sg"
  description = "Allow ECS to connect to RDS"
  vpc_id = "vpc-02394aac3f6ed622b"

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_db_instance" "anushka_db" {
  identifier              = "anushka-db"
  engine                  = "postgres"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  db_name                 = "strapi"
  username                = var.db_username
  password                = var.db_password
  skip_final_snapshot     = true
  multi_az                = false
  publicly_accessible     = false
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
}
