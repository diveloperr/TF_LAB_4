variable "security_group_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ingress_from_port" {
  type = number
}

variable "ingress_to_port" {
  type = number
}

variable "ingress_protocol" {
  type = string
}

variable "ingress_cidr_block" {
  type = any
}