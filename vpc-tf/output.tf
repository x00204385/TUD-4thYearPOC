output "instance_ips" {
  value = join(",", aws_instance.webinstance.*.public_ip)
}

output "instance_dns" {
  value = join(",", aws_instance.webinstance.*.public_dns)
}

output "private_instance_ips" {
  value = join(",", aws_instance.private-instance.*.private_ip)
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = aws_lb.tudproj-LB.dns_name
}

output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.tudproj-rds.address
  sensitive   = true
}
