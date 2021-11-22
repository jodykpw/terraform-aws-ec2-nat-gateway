# AWS EC2 Instance Outputs
output "ec2_bastion_public_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_public.id
}

output "ec2_bastion_public_ip" {
  description = "List of public IP addresses assigned to the instances"
  value       = module.ec2_public.public_ip 
}

output "ec2_bastion_public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_public.*.public_dns
}

output "ec2_private_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_private.id
}

output "ec2_private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = module.ec2_private.private_ip 
}

output "ec2_private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_private.*.public_dns
}




