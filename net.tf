provider "aws" {
    access_key = "AKIAS2GU2XM33W2Q34JC"
    secret_key = "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"
    region = "us-east-2"
}

resource "aws_subnet" "PetclinicNet" {
    vpc_id     = "vpc-d1b531b8"
    cidr_block = "172.31.64.0/20"
    availability_zone = "us-east-2b"


    tags = {
        Name = "PetclinicNet"
    }
}
