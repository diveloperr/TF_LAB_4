variable "vpc_cidr_block" {
  type = string
}

variable "vpc_name" {
  type = string
}

#pub SUBNET variables
variable "pub_a_subnet_cidr_block" {
  type = string
}
variable "pub_a_subnet_name" {
  type = string
}


variable "pub_c_subnet_cidr_block" {
  type = string
}
variable "pub_c_subnet_name" {
  type = string
}

#internet gateway variables

variable "internet_gateway_name" {
  type = string
}

variable "pub_route_name" {
  type = string
}
