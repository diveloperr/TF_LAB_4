
output "output_ec2_ebs_instance_id" {
  value = one(aws_instance.ec2_ebs[*].id)
}