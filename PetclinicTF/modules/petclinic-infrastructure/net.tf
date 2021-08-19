resource "aws_subnet" "PetclinicNet" {
  vpc_id            = "vpc-d1b531b8"
  cidr_block        = var.NetCIDR
  availability_zone = var.availability_zone


  tags = {
    Name = "${var.StageTag***REMOVED***PetclinicNet"
  ***REMOVED***
***REMOVED***
