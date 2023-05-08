resource "aws_efs_file_system" "efs" {
  creation_token = "efs"

  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = false

  # lifecycle_policy {
  #   transition_to_ia = "AFTER_30_DAYS"
  # }

  tags = {
    Name = "efs"
  }
}

resource "aws_efs_mount_target" "zone-a" {
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = aws_subnet.public_eu_west_1a.id
  security_groups = [aws_security_group.allow-all.id]
}

resource "aws_efs_mount_target" "zone-b" {
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = aws_subnet.public_eu_west_1b.id
  security_groups = [aws_security_group.allow-all.id]
}