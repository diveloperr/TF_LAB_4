

module "ec2" {
  source = "../module/ec2"

  enable_ebs_attachment = "false"
  ec2_instance_name     = "${var.name}-ec2"
  ec2_ami_id            = "ami-0ea4d4b8dc1e46212"
  ec2_instance_type     = "t2.micro"
  ec2_securitygroup_id  = module.ec2_sg.output_securitygroup_id
  ec2_subnet_id         = module.network.output_subnet_pub_a_id

  root_volume_size = "10"
  root_volume_type = "gp3"

  data_volume_size = "10"
  data_volume_type = "gp3"

}


module "ec2_ebs" {
  source = "../module/ec2"

  enable_ebs_attachment = "true"
  ec2_instance_name     = "${var.name}-ec2-ebs"
  ec2_ami_id            = "ami-0ea4d4b8dc1e46212"
  ec2_instance_type     = "t2.micro"
  ec2_securitygroup_id  = module.ec2_sg.output_securitygroup_id
  ec2_subnet_id         = module.network.output_subnet_pub_c_id

  root_volume_size = "10"
  root_volume_type = "gp3"

}

module "data_ebs" {
  source                            = "../module/ebs"
  ec2_data_volume_name              = "${var.name}-ec2-ebs-data-ebs"
  ec2_data_volume_size              = "10"
  ec2_data_volume_availability_zone = "ap-northeast-2c"
  ec2_data_volume_type              = "gp3"
  target_instacne_id                = module.ec2_ebs.output_ec2_ebs_instance_id

}