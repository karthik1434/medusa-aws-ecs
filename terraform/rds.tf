resource "aws_db_instance" "medusa_db" {
  engine             = "postgres"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  username          = "medusa"
  password          = "yourpassword"
  publicly_accessible = false
}
