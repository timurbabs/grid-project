resource "aws_subnet" "PetclinicNet" {
    vpc_id     = "vpc-d1b531b8"
    cidr_block = "172.31.64.0/20"
    availability_zone = var.availability_zone


    tags = {
        Name = "PetclinicNet"
    }
}
