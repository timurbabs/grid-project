resource "aws_security_group" "SlaveSG" {
    name = "SlaveSG"
    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_instance" "Slave" {
    ami                     = "ami-0443305dabd4be2bc"
    instance_type           = "t2.medium"
    key_name                = "tbaburin-test-linux-ohio"
    vpc_security_group_ids  = [aws_security_group.JenkinsSG.id]

    root_block_device {
        volume_size           = 10
        delete_on_termination = true
    }

    tags = {
        Name                = "Slave"
        Owner               = "drozhdestvenskii"
    }
}

resource "aws_eip" "SlaveEIP" {
    instance = aws_instance.Slave.id
    tags = {
        Name = "SlaveEIP"
    }
}
