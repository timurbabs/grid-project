resource "aws_security_group" "JenkinsSG" {
    name = "JenkinsSG"
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

    ingress {
        description = "Jenkins HTTP"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "Jenkins HTTP"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Jenkins HTTPS"
        from_port   = 8443
        to_port     = 8443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "Jenkins HTTPS"
        from_port   = 8443
        to_port     = 8443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "50000"
        from_port   = 50000
        to_port     = 50000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "50000"
        from_port   = 50000
        to_port     = 50000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_instance" "Jenkins" {
    ami                     = "ami-0443305dabd4be2bc"
    instance_type           = "t2.medium"
    key_name                = "tbaburin-test-linux-ohio"
    vpc_security_group_ids  = [aws_security_group.JenkinsSG.id]

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
