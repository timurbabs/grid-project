provider "aws" {
    access_key = "AKIAS2GU2XM33W2Q34JC"
    secret_key = "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"
    region = "us-east-2"
}

resource "aws_security_group" "NexusSG" {
    name = "NexusSG"
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
        description = "Nexus HTTP"
        from_port   = 8081
        to_port     = 8081
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "Nexus HTTP"
        from_port   = 8081
        to_port     = 8081
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Docker HTTP (Legacy)"
        from_port   = 8085
        to_port     = 8085
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "Docker HTTP (Legacy)"
        from_port   = 8085
        to_port     = 8085
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Nexus HTTPS"
        from_port   = 8443
        to_port     = 8443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "Nexus HTTPS"
        from_port   = 8443
        to_port     = 8443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Docker Hosted"
        from_port   = 8445
        to_port     = 8445
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "Docker Hosted"
        from_port   = 8445
        to_port     = 8445
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_instance" "Nexus" {
    ami                     = "ami-0443305dabd4be2bc"
    instance_type           = "t2.medium"
    key_name                = "tbaburin-test-linux-ohio"
    vpc_security_group_ids  = [aws_security_group.NexusSG.id]

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
