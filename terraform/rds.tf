resource "aws_db_subnet_group" "medusa_db_subnet_group" {
  name       = "medusa-db-subnet-group"
  subnet_ids = [
    aws_subnet.public_subnet.id,
    aws_subnet.public_subnet_2.id
  ]

  tags = {
    Name = "Medusa DB Subnet Group"
  }
}

resource "aws_db_instance" "medusa_db" {
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = true
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.medusa_db_subnet_group.name
}
