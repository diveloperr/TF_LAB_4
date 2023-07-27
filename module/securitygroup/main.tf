
resource "aws_security_group" "sg" {
  name        = var.security_group_name
  description = var.security_group_name
  vpc_id      = var.vpc_id

  ingress {
    description = "Any Open"
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.ingress_protocol
    cidr_blocks = [var.ingress_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}