resource "aws_security_group" "SlaveSG" {
  name = "${var.StageTag***REMOVED***SlaveSG"
  dynamic "ingress" {
    for_each = ["22"]
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

resource "aws_instance" "Slave" {
  ami                    = var.slave_ami
  instance_type          = var.slave_instance_type
  key_name               = "tbaburin-test-linux-ohio"
  vpc_security_group_ids = [aws_security_group.SlaveSG.id]
  subnet_id              = aws_subnet.PetclinicNet.id
  private_ip             = var.slave_private_ip

  root_block_device {
    volume_size           = var.slave_volume_size
    delete_on_termination = true
  ***REMOVED***

  tags = {
    Name  = "${var.StageTag***REMOVED***Slave"
    Owner = var.owner
  ***REMOVED***
***REMOVED***

resource "aws_eip" "SlaveEIP" {
  instance = aws_instance.Slave.id
  tags = {
    Name = "${var.StageTag***REMOVED***SlaveEIP"
  ***REMOVED***
***REMOVED***

# resource "aws_ami_from_instance" "SlaveAMIStock" {
#   name               = "SlaveAMIStock"
#   source_instance_id = aws_instance.Slave.id
# ***REMOVED***
