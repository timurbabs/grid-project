#Global

variable "access_key" {
    type = string
    default = "AKIAS2GU2XM33W2Q34JC"
}

variable "secret_key" {
    type = string
    default = "kGx4I3KH8QaazRfY/j1mGCZqsKRTWoG8j7Ossf5e"
}

variable "region" {
    type = string
    default = "us-east-2"
}

variable "availability_zone" {
    type = string
    default = "us-east-2b"
}

variable "owner" {
    type = string
    default = "drozhdestvenskii"
}


#Nexus

variable "nexus_ami" {
    type = string
    default = "ami-0443305dabd4be2bc"
}

variable "nexus_instance_type" {
    type = string
    default = "t2.medium"
}

variable "nexus_volume_size" {
    type = string
    default = "10"
}

variable "nexus_private_ip" {
    type = string
    default = "172.31.64.10"
}


#Jenkins

variable "jenkins_ami" {
    type = string
    default = "ami-0443305dabd4be2bc"
}

variable "jenkins_instance_type" {
    type = string
    default = "t2.medium"
}

variable "jenkins_volume_size" {
    type = string
    default = "10"
}

variable "jenkins_private_ip" {
    type = string
    default = "172.31.64.20"
}


#Slave

variable "slave_ami" {
    type = string
    default = "ami-0443305dabd4be2bc"
}

variable "slave_instance_type" {
    type = string
    default = "t2.medium"
}

variable "slave_volume_size" {
    type = string
    default = "10"
}

variable "slave_private_ip" {
    type = string
    default = "172.31.64.30"
}


#DevProd

variable "devprod_ami" {
    type = string
    default = "ami-0443305dabd4be2bc"
}

variable "devprod_instance_type" {
    type = string
    default = "t2.medium"
}

variable "devprod_volume_size" {
    type = string
    default = "10"
}

variable "devprod_private_ip" {
    type = string
    default = "172.31.64.40"
}

#PROD

variable "prod_ami" {
    type = string
    default = "ami-0443305dabd4be2bc"
}

variable "prod_instance_type" {
    type = string
    default = "t2.medium"
}

variable "prod_volume_size" {
    type = string
    default = "10"
}

variable "prod_private_ip" {
    type = string
    default = "172.31.64.50"
}
