resource "aws_security_group" "NexusSG" {
    name = "NexusSG"

    dynamic "ingress" {
        for_each = ["22", "8081", "8085", "8443", "8444", "8445"]
        content {
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        for_each = ["22", "8081", "8085", "8443", "8444", "8445"]
        content {
            from_port = egress.value
            to_port = egress.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

}

resource "aws_instance" "Nexus" {
    ami                     = "ami-0443305dabd4be2bc"
    instance_type           = "t2.medium"
    key_name                = "tbaburin-test-linux-ohio"
    vpc_security_group_ids  = [aws_security_group.NexusSG.id]
    subnet_id = aws_subnet.PetclinicNet.id
    private_ip = "172.31.64.10"

    root_block_device {
        volume_size           = 10
        delete_on_termination = true
    }

    tags = {
        Name                = "Nexus"
        Owner               = "drozhdestvenskii"
    }
}

resource "aws_eip" "NexusEIP" {
    instance = aws_instance.Nexus.id
    tags = {
        Name = "NexusEIP"
    }
}

resource "aws_ami_from_instance" "NexusAMIStock" {
    name               = "NexusAMIStock"
    source_instance_id = aws_instance.Nexus.id
}
