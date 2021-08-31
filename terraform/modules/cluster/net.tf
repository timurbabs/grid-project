resource "aws_subnet" "PetclinicNet-2b" {
  vpc_id            = var.VPC
  cidr_block        = var.CIDR_b
  availability_zone = "${var.Region}b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "PetclinicNet"
  }
}

resource "aws_subnet" "PetclinicNet-2a" {
  vpc_id            = var.VPC
  cidr_block        = var.CIDR_a
  availability_zone = "${var.Region}a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "PetclinicNet"
  }
}
