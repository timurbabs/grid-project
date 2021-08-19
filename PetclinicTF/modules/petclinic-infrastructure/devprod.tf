resource "aws_security_group" "DevProdSG" {
  name = "${var.StageTag***REMOVED***DevProdSG"
  dynamic "ingress" {
    for_each = ["22", "8080", "8085", "8443", "8444", "8445"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    ***REMOVED***
  ***REMOVED***

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  ***REMOVED***


***REMOVED***

resource "aws_instance" "DevProd" {
  ami                    = var.devprod_ami
  instance_type          = var.devprod_instance_type
  key_name               = "tbaburin-test-linux-ohio"
  vpc_security_group_ids = [aws_security_group.DevProdSG.id]
  subnet_id              = aws_subnet.PetclinicNet.id

  root_block_device {
    volume_size           = var.devprod_volume_size
    delete_on_termination = true
  ***REMOVED***

  tags = {
    Name  = "${var.StageTag***REMOVED***DevProd"
    Owner = var.owner
  ***REMOVED***
***REMOVED***

resource "aws_eip" "DevProdEIP" {
  instance = aws_instance.DevProd.id
  tags = {
    Name = "${var.StageTag***REMOVED***DevProdEIP"
  ***REMOVED***
***REMOVED***

# resource "aws_ami_from_instance" "DevProdAMIStock" {
#   name               = "DevProdAMIStock"
#   source_instance_id = aws_instance.DevProd.id
# ***REMOVED***
