resource "local_file" "AnsibleInventory" {
  content = templatefile("./PetclinicTF/modules/petclinic-infrustructure/inventory.tmpl",
    {
      nexus-dns        = aws_eip.NexusEIP.public_dns,
      nexus-ip         = aws_eip.NexusEIP.public_ip,
      nexus-id         = aws_instance.Nexus.id,
      nexus-private-ip = aws_instance.Nexus.private_ip

      jenkins-dns        = aws_eip.JenkinsEIP.public_dns,
      jenkins-ip         = aws_eip.JenkinsEIP.public_ip,
      jenkins-id         = aws_instance.Jenkins.id,
      jenkins-private-ip = aws_instance.Jenkins.private_ip

      slave-dns        = aws_eip.SlaveEIP.public_dns,
      slave-ip         = aws_eip.SlaveEIP.public_ip,
      slave-id         = aws_instance.Slave.id,
      slave-private-ip = aws_instance.Slave.private_ip

      devprod-dns        = aws_eip.DevProdEIP.public_dns,
      devprod-ip         = aws_eip.DevProdEIP.public_ip,
      devprod-id         = aws_instance.DevProd.id,
      devprod-private-ip = aws_instance.DevProd.private_ip
    ***REMOVED***
  )
  filename = "./inventory.yml"
***REMOVED***
