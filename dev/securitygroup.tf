

module "ec2_sg" {
  source = "../module/securitygroup"

  vpc_id              = module.network.output_vpc_id
  security_group_name = "${var.name}-ec2-sg"

  ingress_from_port = 0
  ingress_to_port   = 65535
  ingress_protocol  = "tcp"

  ingress_cidr_block = "0.0.0.0/0"
}