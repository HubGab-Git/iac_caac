output "bastion_public_dns" {
  description = "Public DNS name of bastion Instance"
  value       = aws_instance.bastion.public_dns
}

output "database_endpoint" {
  description = "Database endpoint"
  value       = aws_db_instance.database.endpoint
}