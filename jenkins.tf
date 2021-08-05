resource "aws_security_group" "JenkinsSG" {
    name = "JenkinsSG"

    dynamic "ingress" {
        for_each = ["22", "8080", "50000"]
        content {
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        for_each = ["22", "8080", "50000"]
        content {
            from_port = egress.value
            to_port = egress.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

}

resource "aws_instance" "Jenkins" {
    ami                     = "ami-0443305dabd4be2bc"
    instance_type           = "t2.medium"
    key_name                = "tbaburin-test-linux-ohio"
    vpc_security_group_ids  = [aws_security_group.JenkinsSG.id]
    subnet_id = aws_subnet.PetclinicNet.id
    private_ip = "172.31.64.20"

    root_block_device {
        volume_size           = 10
        delete_on_termination = true
    }

    tags = {
        Name                = "Jenkins"
        Owner               = "drozhdestvenskii"
    }
}

resource "aws_eip" "JenkinsEIP" {
    instance = aws_instance.Jenkins.id
    tags = {
        Name = "JenkinsEIP"
    }
}

resource "aws_ami_from_instance" "JenkinsAMIStock" {
    name               = "JenkinsAMIStock"
    source_instance_id = aws_instance.Jenkins.id
}
