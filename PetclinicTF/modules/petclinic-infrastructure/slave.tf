resource "aws_security_group" "SlaveSG" {
  name = "${var.StageTag}SlaveSG"
  dynamic "ingress" {
    for_each = ["22"]
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

resource "aws_instance" "Slave" {
  ami                    = var.slave_ami
  instance_type          = var.slave_instance_type
  key_name               = "tbaburin-test-linux-ohio"
  vpc_security_group_ids = [aws_security_group.SlaveSG.id]
  subnet_id              = aws_subnet.PetclinicNet.id

  root_block_device {
    volume_size           = var.slave_volume_size
    delete_on_termination = true
  }

  tags = {
    Name  = "${var.StageTag}Slave"
    Owner = var.owner
  }
}

resource "aws_eip" "SlaveEIP" {
  instance = aws_instance.Slave.id
  tags = {
    Name = "${var.StageTag}SlaveEIP"
  }
}

# resource "aws_ami_from_instance" "SlaveAMIStock" {
#   name               = "SlaveAMIStock"
#   source_instance_id = aws_instance.Slave.id
# }
