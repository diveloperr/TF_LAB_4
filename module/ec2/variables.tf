variable "enable_ebs_attachment" {
  type = string
}

variable "ec2_ami_id" {
  type = string
}

variable "ec2_instance_name" {
  type = string
}

variable "ec2_instance_type" {
  type = string
}

variable "ec2_securitygroup_id" {
  type = string
}


variable "ec2_subnet_id" {
  type = string
}


variable "root_volume_size" {
  type = string
}

variable "root_volume_type" {
  type = string
}


variable "data_volume_size" {
  type = string
  default = ""
}

variable "data_volume_type" {
  type = string
  default = ""
}
