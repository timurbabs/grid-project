resource "aws_security_group" "ProdSG" {
    name = "ProdSG"

    dynamic "ingress" {
        for_each = ["22", "8080", "443"]
        content {
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_instance" "Prod" {
    ami                     = var.prod_ami
    instance_type           = var.prod_instance_type
    key_name                = "tbaburin-test-linux-ohio"
    vpc_security_group_ids  = [aws_security_group.ProdSG.id]
    subnet_id = aws_subnet.PetclinicNet.id
    private_ip = var.prod_private_ip

    root_block_device {
        volume_size           = var.prod_volume_size
        delete_on_termination = true
    }

    tags = {
        Name                = "Production"
        Owner               = var.owner
    }
}

resource "aws_eip" "ProdEIP" {
    instance = aws_instance.Prod.id
    tags = {
        Name = "ProdEIP"
    }
}

resource "aws_ami_from_instance" "ProdAMIStock" {
    name               = "ProdAMIStock"
    source_instance_id = aws_instance.Prod.id
}
