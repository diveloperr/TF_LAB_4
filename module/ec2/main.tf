
resource "aws_instance" "ec2" {

  count = var.enable_ebs_attachment ? 0 : 1
  ami                    = var.ec2_ami_id
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = [var.ec2_securitygroup_id]
  subnet_id              = var.ec2_subnet_id

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    encrypted             = "true"
    delete_on_termination = "true"
    tags = {
      Name = var.ec2_instance_name
    }
  }

  ebs_block_device {
    device_name           = "/dev/xvdb"
    volume_size           = var.data_volume_size
    volume_type           = var.data_volume_type
    delete_on_termination = "true" 
    encrypted             = "true" 
  }

  tags = {
    Name = var.ec2_instance_name
  }
}

resource "aws_instance" "ec2_ebs" {
  count = var.enable_ebs_attachment ? 1 : 0
  ami                    = var.ec2_ami_id
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = [var.ec2_securitygroup_id]
  subnet_id              = var.ec2_subnet_id

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    encrypted             = "true"
    delete_on_termination = "true"
    tags = {
      Name = var.ec2_instance_name
    }
  }


  tags = {
    Name = var.ec2_instance_name
  }
}



