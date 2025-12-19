output "ec2_instance_ids" {
  description = "EC2 instance IDs created per environment"
  value       = module.ec2.instance_ids
}
