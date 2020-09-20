output "id" {
  description = "List of IDs of instances"
  value       = aws_instance.Openshift.*.id
}

output "arn" {
  description = "List of ARNs of instances"
  value       = aws_instance.Openshift.*.arn
}

output "availability_zone" {
  description = "List of availability zones of instances"
  value       = aws_instance.Openshift.*.availability_zone
}

output "instance_count" {
  description = "Number of instances to launch specified as argument to this module"
  value       = var.instance_count
}
