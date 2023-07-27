

module "network" {
  source = "../module/network"

  #VPC
  vpc_cidr_block = "10.0.0.0/16"
  vpc_name       = "${var.name}-terraform-vpc"

  #PUBLIC SUBNET
  pub_a_subnet_cidr_block = "10.0.10.0/24"
  pub_c_subnet_cidr_block = "10.0.20.0/24"

  pub_a_subnet_name = "${var.name}-terraform-pub-sub-a"
  pub_c_subnet_name = "${var.name}-terraform-pub-sub-c"


  #INTERNET GW
  internet_gateway_name = "${var.name}-terraform-igw"

  #PUBLIC ROUTE
  pub_route_name = "${var.name}-terraform-public-rt"

}
