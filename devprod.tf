resource "aws_security_group" "DevProdSG" {
    name = "DevProdSG"
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
        description = "DevProd HTTP"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "DevProd HTTP"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "DevProd HTTPS"
        from_port   = 8443
        to_port     = 8443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "DevProd HTTPS"
        from_port   = 8443
        to_port     = 8443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }


}

resource "aws_instance" "DevProd" {
    ami                     = "ami-0443305dabd4be2bc"
    instance_type           = "t2.medium"
    key_name                = "tbaburin-test-linux-ohio"
    vpc_security_group_ids  = [aws_security_group.JenkinsSG.id]

    root_block_device {
        volume_size           = 10
        delete_on_termination = true
    }

    tags = {
        Name                = "DevProd"
        Owner               = "drozhdestvenskii"
    }
}

resource "aws_eip" "DevProdEIP" {
    instance = aws_instance.DevProd.id
    tags = {
        Name = "DevProdEIP"
    }
}
