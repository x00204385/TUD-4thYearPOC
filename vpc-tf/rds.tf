
resource "aws_db_subnet_group" "tudproj-db-subnetgroup" {
  name       = "tudproj-db-subnetgroup"
  subnet_ids = [aws_subnet.public-subnet-1a.id, aws_subnet.public-subnet-1b.id]
  tags = {
    Name = "TUD POC DB subnet group"
  }
}


# Create MySQL RDS instance
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance
#
resource "aws_db_instance" "tudproj-rds" {
  allocated_storage    = 20
  db_name              = "mysqldatabase"
  identifier           = "tudproj-rdsdb"
  engine               = "mysql"
  engine_version       = "8.0"
  storage_type         = "gp2"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  db_subnet_group_name = "tudproj-db-subnetgroup"
#  vpc_security_group_ids = [aws_security_group.allow-mysql.id]
  publicly_accessible  = true

  depends_on = [aws_db_subnet_group.tudproj-db-subnetgroup, aws_internet_gateway.internet-gw]
  
  tags = {
    Name = "tudproj-internet-gw"
  }

}


