resource "aws_security_group" "JenkinsSG" {
  name = "JenkinsSG"

  dynamic "ingress" {
    for_each = ["22", "8080", "8443", "50000"]
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

resource "aws_instance" "Jenkins" {
  ami                    = var.jenkins_ami
  instance_type          = var.jenkins_instance_type
  key_name               = "tbaburin-test-linux-ohio"
  vpc_security_group_ids = [aws_security_group.JenkinsSG.id]
  subnet_id              = aws_subnet.PetclinicNet.id
  private_ip             = var.jenkins_private_ip

  root_block_device {
    volume_size           = var.jenkins_volume_size
    delete_on_termination = true
  ***REMOVED***

  tags = {
    Name  = "Jenkins"
    Owner = var.owner
  ***REMOVED***
***REMOVED***

resource "aws_eip" "JenkinsEIP" {
  instance = aws_instance.Jenkins.id
  tags = {
    Name = "JenkinsEIP"
  ***REMOVED***
***REMOVED***

resource "aws_ami_from_instance" "JenkinsAMIStock" {
  name               = "JenkinsAMIStock"
  source_instance_id = aws_instance.Jenkins.id
***REMOVED***
