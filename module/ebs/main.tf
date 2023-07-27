
resource "aws_ebs_volume" "ec2_data_volume" {
  availability_zone = var.ec2_data_volume_availability_zone
  size              = var.ec2_data_volume_size
  type              = var.ec2_data_volume_type

  tags = {
    Name = var.ec2_data_volume_name
  }
}


resource "aws_volume_attachment" "ebsAttach" {
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.ec2_data_volume.id
  instance_id = var.target_instacne_id

}

