resource "aws_security_group" "NodesSecurityGroup" {
    name = "NodesSecurityGroup"

    dynamic "ingress" {
      for_each = ["22", "8081", "8080", "443", "80"]
      content {
        from_port   = ingress.value
        to_port     = ingress.value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }

    egress {
      from_port   = "0"
      to_port     = "0"
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}
