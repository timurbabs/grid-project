provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = var.region
}

resource "aws_subnet" "PetclinicNet" {
    vpc_id     = "vpc-d1b531b8"
    cidr_block = "172.31.64.0/20"
    availability_zone = var.availability_zone


    tags = {
        Name = "PetclinicNet"
    }
}
